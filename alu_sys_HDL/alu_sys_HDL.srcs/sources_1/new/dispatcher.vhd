library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dispatcher is
	Generic (
		TDATA_WIDTH		: positive := 32
	);
	Port (
		ap_clk			: in std_logic;
		ap_rst			: in std_logic;

		s_axis_tvalid	: in std_logic;
		s_axis_tdata_a	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
        s_axis_tdata_b	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready	: out std_logic;
        s_axis_tid      : in std_logic_vector(5 downto 0);

		m_axis_tvalid_sum	: out std_logic;
		m_axis_tdata_sum_a	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_sum_b	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_sum	: in std_logic;
        m_axis_tid_sum      : out std_logic_vector(5 downto 0);

        m_axis_tvalid_sub	: out std_logic;
		m_axis_tdata_sub_a	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_sub_b	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_sub	: in std_logic;
        m_axis_tid_sub      : out std_logic_vector(5 downto 0);

        m_axis_tvalid_div	: out std_logic;
		m_axis_tdata_div_a	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_div_b	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_div	: in std_logic;
        m_axis_tid_div      : out std_logic_vector(5 downto 0);

        m_axis_tvalid_mul	: out std_logic;
		m_axis_tdata_mul_a	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
        m_axis_tdata_mul_b	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready_mul	: in std_logic;
        m_axis_tid_mul      : out std_logic_vector(5 downto 0);

        RAM_address         : out std_logic_vector(5 downto 0);
        RAM_value           : in std_logic_vector(TDATA_WIDTH-1 downto 0)

	);
end dispatcher;

architecture Behavioral of dispatcher is

    signal data_a	          : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others=>'0');
    signal data_b	          : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others=>'0');
    signal RAM_value_sgn      :  std_logic_vector(TDATA_WIDTH-1 downto 0);
    signal RAM_address_sgn    :  std_logic_vector(5 downto 0);


    --signal RAM_address    : std_logic_vector(5 downto 0) := (Others=>'0');

    -------------  State variable -----------
    type state is (IDLE, ASK_RAM, STAND_BY, DISPATCHER, SUM, SUB, DIV, MUL);  
    signal fsm_state : state := IDLE;
    -----------------------------------------

begin

    -- SLAVE --
    with fsm_state select s_axis_tready <= 
        '1' when ASK_RAM,
        '0' when Others;
    
    -- MASTER --

    -- SUM --
    with fsm_state select m_axis_tdata_sum_a <=
        data_a                                              when SUM,
        (others => '-')                                     when others;
    with fsm_state select m_axis_tdata_sum_b <=
        data_b                                              when SUM,
        (others => '-')                                     when others;


    -- SUB --
    with fsm_state select m_axis_tdata_sub_a <=
        data_a                                              when SUB,
        (others => '-')                                     when others;
    with fsm_state select m_axis_tdata_sub_b <=
        data_b                                              when SUB,
        (others => '-')                                     when others;


    -- MUL --
    with fsm_state select m_axis_tdata_mul_a <=
        data_a                                              when MUL,
        (others => '-')                                     when others;
    with fsm_state select m_axis_tdata_mul_b <=
        data_b                                              when MUL,
        (others => '-')                                     when others;


    -- DIV --
    with fsm_state select m_axis_tdata_div_a <=
        data_a                                              when DIV,
        (others => '-')                                     when others;
    with fsm_state select m_axis_tdata_div_b <=
        data_b                                              when DIV,
        (others => '-')                                     when others;


    with fsm_state select m_axis_tvalid_sum <=
        '1'	when SUM,
        '0' when Others;

    with fsm_state select m_axis_tvalid_sub <=
        '1'	when SUB,
        '0' when Others;

    with fsm_state select m_axis_tvalid_div <=
        '1'	when DIV,
        '0' when Others;

    with fsm_state select m_axis_tvalid_mul <=
        '1'	when MUL,
        '0' when Others;

    RAM_address <= RAM_address_sgn;

    FSM_MUTE : process (ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then

                fsm_state           <= IDLE;   
    
            else
    
                case (fsm_state) is	

                    When IDLE => 

                        fsm_state 			<= ASK_RAM;

                    when ASK_RAM =>	

                        if (s_axis_tvalid = '1') then

                            data_a	        <= s_axis_tdata_a;
                            data_b	        <= s_axis_tdata_b;

                            RAM_address_sgn     <= s_axis_tid;

                            fsm_state 		<= STAND_BY;

                        else 

                            fsm_state 		<= ASK_RAM;

                        end if;

                    when STAND_BY =>

                        fsm_state <= DISPATCHER;

                    when DISPATCHER =>

                        RAM_value_sgn <= RAM_value;

                        if(RAM_value_sgn /= RAM_value) then
                            if      (RAM_value_sgn = "00000000000000000000000000000001") then
                            
                                m_axis_tid_sub  <= s_axis_tid;
                                fsm_state       <= SUB;
    
                            elsif   (RAM_value_sgn = "00000000000000000000000000000010") then
    
                                m_axis_tid_div  <= s_axis_tid;
                                fsm_state <= DIV;
    
                            elsif   (RAM_value_sgn = "00000000000000000000000000000011") then
                            
                                m_axis_tid_mul  <= s_axis_tid;
                                fsm_state <= MUL;
    
                            else -- if   (RAM_value = "0000000000000000000000000000000") then
    
                                m_axis_tid_sum  <= s_axis_tid;
                                fsm_state <= SUM;
    
                            end if;
                        else
                            if      (RAM_value = "00000000000000000000000000000001") then
                            
                                m_axis_tid_sub  <= s_axis_tid;
                                fsm_state       <= SUB;
    
                            elsif   (RAM_value = "00000000000000000000000000000010") then
    
                                m_axis_tid_div  <= s_axis_tid;
                                fsm_state <= DIV;
    
                            elsif   (RAM_value = "00000000000000000000000000000011") then
                            
                                m_axis_tid_mul  <= s_axis_tid;
                                fsm_state <= MUL;
    
                            else -- if   (RAM_value = "0000000000000000000000000000000") then
    
                                m_axis_tid_sum  <= s_axis_tid;
                                fsm_state <= SUM;
    
                            end if;
                        end if;

                    when SUM =>                                                                
                        
                        if (m_axis_tready_sum = '1') then 
                               	   
                            fsm_state           <= ASK_RAM;

                        end if;

                    when SUB =>                                                                
                        
                        if (m_axis_tready_sub = '1') then 

                            --m_axis_tdata_sub_a  <=data_a;
                            --m_axis_tdata_sub_b  <=data_b;
                                       	   
                            fsm_state           <= ASK_RAM;

                        end if;
                    
                    when DIV =>                                                                
                        
                        if (m_axis_tready_div = '1') then 

                            --m_axis_tdata_div_a  <=data_a;
                            --m_axis_tdata_div_b  <=data_b;
                                       	   
                            fsm_state           <= ASK_RAM;

                        end if;
                    
                    when MUL =>                                                                
                        
                        if (m_axis_tready_mul = '1') then 
                            
                            --m_axis_tdata_mul_a  <=data_a;
                            --m_axis_tdata_mul_b  <=data_b;
                                       	   
                            fsm_state           <= ASK_RAM;

                        end if;

                    when Others =>        

                        fsm_state               <= IDLE;
                                                
                end case;
            end if;
        end if;
    end process;                                                              
end Behavioral;
