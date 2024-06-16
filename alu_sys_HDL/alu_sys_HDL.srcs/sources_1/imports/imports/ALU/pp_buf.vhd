library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pp_buf is
	Generic (
		TDATA_WIDTH		: positive := 32
	);
	Port (
		ap_clk			: in std_logic;
		ap_rst			: in std_logic;
        ap_idle         : out std_logic;
        ap_start        : in std_logic;
        ap_ready        : out std_logic;

		s_axis_tvalid_a	: in std_logic;
		s_axis_tdata_a	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready_a	: out std_logic;

        s_axis_tvalid_b	: in std_logic;
		s_axis_tdata_b	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready_b	: out std_logic;

		m_axis_tvalid_sum	: out std_logic;
		m_axis_tdata_sum_1	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_sum_2	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_sum	: in std_logic;

        m_axis_tvalid_sub	: out std_logic;
        m_axis_tdata_sub_1	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_sub_2	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_sub	: in std_logic;

        m_axis_tvalid_mul	: out std_logic;
        m_axis_tdata_mul_1	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_mul_2	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_mul	: in std_logic;

        m_axis_tvalid_div	: out std_logic;
        m_axis_tdata_div_1	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_div_2	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_div	: in std_logic;

        RAM_value           : in std_logic_vector(TDATA_WIDTH-1 downto 0);
        RAM_address         : out std_logic_vector(5 downto 0);

        data_id_sum         : out std_logic_vector(5 downto 0);
        data_id_sub         : out std_logic_vector(5 downto 0);
        data_id_mul         : out std_logic_vector(5 downto 0);
        data_id_div         : out std_logic_vector(5 downto 0)

	);
end pp_buf;

architecture Behavioral of pp_buf is

    signal data_a_read      : std_logic:='0';
    signal data_b_read      : std_logic:='0';
    signal data_in_a 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal data_in_b 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    
    signal data_a_1      : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal data_a_2      : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    
    signal data_b_1      : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal data_b_2      : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    
    signal flag             : std_logic:='0';
    signal ALU_operation_MEM_q0 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');

    signal s_axis_tvalid    : std_logic := '0';
    
    signal data_id_sgn      : unsigned(5 downto 0) := (Others => '0');

    signal pp               : std_logic := '0';

    -------------  State variable -----------
    type state is (IDLE, DATA_REQUEST, PING, PONG);  
    signal fsm_state : state := IDLE;
    -----------------------------------------

begin

    ALU_operation_MEM_q0 <= RAM_value;

    s_axis_tvalid        <= s_axis_tvalid_a and s_axis_tvalid_b;
    --data_not_empty              <= data_a_empty_n and data_b_empty_n;   -- Check if both FIFOs are not empty 

   RAM_address  <=   std_logic_vector(data_id_sgn);

    -- SLAVE --
--    with fsm_state select s_axis_tready_a <= 
--        '1' when DATA_REQUEST,
--        '1' when PING,
--        '1' when PONG,
--        '0' when Others;

    s_axis_tready_a <= data_a_read;
    s_axis_tready_b <= data_b_read;


--    with fsm_state select s_axis_tready_b <= 
--        '1' when DATA_REQUEST,
--        '1' when PING,
--        '1' when PONG,
--        '0' when Others;  
        
    with fsm_state select ap_ready <= 
        '1' when DATA_REQUEST,
        '1' when PING,
        '1' when PONG,
        '0' when Others; 
        
     with fsm_state select ap_idle <=                -- ap_idle is asserted when FSM is in IDLE state, ALU goes in IDLE when a burst has been completed
        '1' when IDLE,
        '0' when Others;      
    
    -- MASTER --
    m_axis_tvalid_sum <= '1' when (((fsm_state = PING) or (fsm_state = PONG)) and (ALU_operation_MEM_q0 = "00000000000000000000000000000000")) else '0'; -- sum
    m_axis_tvalid_sub <= '1' when (((fsm_state = PING) or (fsm_state = PONG)) and (ALU_operation_MEM_q0 = "00000000000000000000000000000001")) else '0'; -- sub
    m_axis_tvalid_mul <= '1' when (((fsm_state = PING) or (fsm_state = PONG)) and (ALU_operation_MEM_q0 = "00000000000000000000000000000010")) else '0'; -- mul
    m_axis_tvalid_div <= '1' when (((fsm_state = PING) or (fsm_state = PONG)) and (ALU_operation_MEM_q0 = "00000000000000000000000000000011")) else '0'; -- div

    FSM_PP : process (ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then
    
                data_in_a 	    <= (Others => '0');
                data_in_b 		<= (Others => '0');

                fsm_state           <= IDLE;   
    
            else
    
                case (fsm_state) is	

                    when IDLE =>

                        if (ap_start = '1') then ------------ DA RIVEDERE

                            fsm_state <= DATA_REQUEST;

                        end if;
                    
                    when DATA_REQUEST =>                -- Inform both FIFOs that have to be read

                        if (s_axis_tvalid = '1') then

                            data_a_read <= '1';
                            data_b_read <= '1';

                            if (pp = '0') then

                                pp          <= '1';
                                fsm_state   <= PING;

                            else

                                pp          <= '0';
                                fsm_state   <= PONG;

                            end if;
                            
                        else

                            fsm_state <= DATA_REQUEST;

                        end if;

                    when PING =>                -- Store FIFOs data in registers, then go to computation 

                        -- store up data
                        data_a_1    <= s_axis_tdata_a;
                        data_b_1    <= s_axis_tdata_b;

                        data_a_read <= '0';
                        data_b_read <= '0';

                        if (data_id_sgn = 0) then
                            
                            flag <= '1';
                            fsm_state <= DATA_REQUEST;

                        end if;

                        -- send down data
                        if (ALU_operation_MEM_q0 = "00000000000000000000000000000000" and m_axis_tready_sum='1') then --and flag='1') then 
                            
                            m_axis_tdata_sum_1  <= data_a_2;
                            m_axis_tdata_sum_2  <= data_b_2;

                            data_id_sum <= std_logic_vector(data_id_sgn);

                            if (data_id_sgn = 49) then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;

                        elsif (ALU_operation_MEM_q0 = "00000000000000000000000000000001" and m_axis_tready_sub='1') then -- and flag='1') then

                            m_axis_tdata_sub_1  <= data_a_2;
                            m_axis_tdata_sub_2  <= data_b_2;

                            data_id_sub <= std_logic_vector(data_id_sgn);
              
                            if (data_id_sgn = 49) then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;

                        elsif (ALU_operation_MEM_q0 = "00000000000000000000000000000010" and m_axis_tready_mul='1') then -- and flag='1') then
                            
                            m_axis_tdata_mul_1  <= data_a_2;
                            m_axis_tdata_mul_2  <= data_b_2;

                            data_id_mul <= std_logic_vector(data_id_sgn);

                            if (data_id_sgn = 49) then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;
                            
                        elsif (ALU_operation_MEM_q0 = "00000000000000000000000000000011" and m_axis_tready_div='1') then -- and flag='1') then
                            
                            m_axis_tdata_div_1  <= data_a_2;
                            m_axis_tdata_div_2  <= data_b_2;

                            data_id_div <= std_logic_vector(data_id_sgn);

                            if (data_id_sgn = 49) then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;

                        end if;
                 
                    when PONG =>

                        -- store down data
                        if (data_id_sgn < 49) then
                            data_a_2    <= s_axis_tdata_a;
                            data_b_2    <= s_axis_tdata_b;
                        end if;

                        data_a_read <= '0';
                        data_b_read <= '0';

                        -- send up data
                        if (ALU_operation_MEM_q0 = "00000000000000000000000000000000" and m_axis_tready_sum='1') then -- and flag='1') then 
                            
                            m_axis_tdata_sum_1  <= data_a_1;
                            m_axis_tdata_sum_2  <= data_b_1;

                            data_id_sum <= std_logic_vector(data_id_sgn);

                            if (data_id_sgn = 49)then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;

                        elsif (ALU_operation_MEM_q0 = "00000000000000000000000000000001" and m_axis_tready_sub='1') then -- and flag='1') then

                            m_axis_tdata_sub_1  <= data_a_1;
                            m_axis_tdata_sub_2  <= data_b_1;

                            data_id_sub <= std_logic_vector(data_id_sgn);
              
                            if (data_id_sgn = 49) then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;

                        elsif (ALU_operation_MEM_q0 = "00000000000000000000000000000010" and m_axis_tready_mul='1') then -- and flag='1') then
                            
                            m_axis_tdata_mul_1  <= data_a_1;
                            m_axis_tdata_mul_2  <= data_b_1;

                            data_id_mul <= std_logic_vector(data_id_sgn);

                            if (data_id_sgn = 49)then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;
                            
                        elsif (ALU_operation_MEM_q0 = "00000000000000000000000000000011" and m_axis_tready_div='1') then -- and flag='1') then
                            
                            m_axis_tdata_div_1  <= data_a_1;
                            m_axis_tdata_div_2  <= data_b_1;

                            data_id_div <= std_logic_vector(data_id_sgn);

                            if (data_id_sgn = 49)then
                                fsm_state <= IDLE;
                            else
                                data_id_sgn <= data_id_sgn + 1;
                                fsm_state           <= DATA_REQUEST;
                            end if;

                        end if;

                    when Others =>        

                        fsm_state               <= IDLE;
                                                
                end case;
            end if;
        end if;
    end process;                                                              
end Behavioral;
