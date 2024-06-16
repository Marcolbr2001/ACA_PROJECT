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

        CE_pp           : in std_logic; -- PP chip enable, it has to be deasserted only if burst is finished

		s_axis_tvalid_a	: in std_logic;
		s_axis_tdata_a	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready_a	: out std_logic;

        s_axis_tvalid_b	: in std_logic;
		s_axis_tdata_b	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready_b	: out std_logic;

        m_axis_tvalid	: out std_logic;
		m_axis_tdata_a	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_b	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready	: in std_logic;

        m_axis_tid      : out std_logic_vector(5 downto 0)
    );
end pp_buf;

architecture Behavioral of pp_buf is

    signal data_in_a 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal data_in_b 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal s_axis_tvalid    : std_logic := '0';
    signal s_axis_tready    : std_logic := '0';
    
    signal up_a             : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal up_b             : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    
    signal down_a           : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal down_b           : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');

    signal m_axis_tid_sgn : std_logic_vector(5 downto 0) := (Others => '0');

    signal data_out 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');

    signal pp, po_1, pi_1               : std_logic := '0';

    -------------  State variable -----------
    type state is (IDLE, PING, PONG);  
    signal fsm_state : state := IDLE;
    -----------------------------------------

begin

    s_axis_tvalid           <= s_axis_tvalid_a and s_axis_tvalid_b; -- FIFO are not empty


    -- SLAVE --     
    s_axis_tready       <= '1' when (fsm_state = PING and (m_axis_tready = '1')) or (fsm_state = PONG and (m_axis_tready = '1')) else '0';
    s_axis_tready_a     <= s_axis_tready;
    s_axis_tready_b     <= s_axis_tready;

    -- ap_ready <= s_axis_tready_a and s_axis_tready_b; -- DA FARE NEL TOP 
    
    -- MASTER --
--    with fsm_state select m_axis_tvalid <=
--        '1'	when PONG,
--        '1'	when PING,
--        '0' when Others;
        
    m_axis_tvalid <= '1' when (fsm_state = PING or fsm_state = PONG) and (pi_1 = '1') else '0';    
        
        
--    with fsm_state select m_axis_tdata_a <=
--        up_a                when PONG,
--        down_a              when PING,
--        (Others=>'-')       when Others;

    m_axis_tdata_a <=   up_a   when fsm_state = PONG and pi_1 = '1' else
                        down_a when fsm_state = PING and po_1 = '1' else (Others => '-');
                        
    m_axis_tdata_b <=   up_b   when fsm_state = PONG and pi_1 = '1' else
                        down_b when fsm_state = PING and po_1 = '1' else (Others => '-');

--    with fsm_state select m_axis_tdata_b <=
--        up_b                when PONG,
--        down_b              when PING,
--        (Others=>'-')       when Others;
    
    FSM_id : process (ap_clk)
        begin
            if rising_edge(ap_clk) then
                if (ap_rst = '1') then
    
                   
        
                else
                
                    m_axis_tid              <= m_axis_tid_sgn;
                
                end if;
            end if;
        end process;
    
        FSM_PP : process (ap_clk)
        begin
            if rising_edge(ap_clk) then
                if (ap_rst = '1') then
    
                    fsm_state           <= IDLE;   
        
                else
        
                    case (fsm_state) is	
    
                        When IDLE => 
    
                            if(CE_pp = '1') then
                                fsm_state 			<= PING;
                            else
                                
                                fsm_state           <= IDLE;
                                
                                pi_1 <= '0';
                                po_1 <= '0';

                                m_axis_tid_sgn          <=(Others=>'0');
                                
                            end if;

                        when PING =>                                                                
                            
                            if(CE_pp = '1') then
                                
                                pi_1 <= '1';
                                
                                if (m_axis_tready = '1') then    

                                    if(s_axis_tvalid = '1') then -- store only if there are something in FIFOs

                                        up_a <= s_axis_tdata_a;
                                        up_b <= s_axis_tdata_b;

                                        if(pi_1 = '1') then
                                            m_axis_tid_sgn <= std_logic_vector(unsigned(m_axis_tid_sgn) + 1);
                                        end if;
                                    end if;

                                    fsm_state           <= PONG;

        
                                end if;

                            else

                                fsm_state <= IDLE;

                            end if;
                            
                        when PONG =>                                                                
                            
                            if(CE_pp = '1') then

                                po_1 <= '1';

                                if (m_axis_tready = '1') then    
        
                                    if(s_axis_tvalid = '1') then -- store only if there are something in FIFOs
        
                                        down_a <= s_axis_tdata_a;
                                        down_b <= s_axis_tdata_b;

                                        if(po_1 = '1') then
                                            m_axis_tid_sgn <= std_logic_vector(unsigned(m_axis_tid_sgn) + 1);
                                        end if;

                                    end if;

                                    fsm_state           <= PING;
        
                                end if;

                            else

                                fsm_state <= IDLE;

                            end if;

                        when Others =>        
    
                            fsm_state               <= IDLE;
                                                    
                    end case;
                end if;
            end if;
        end process;                                                              
    end Behavioral;
