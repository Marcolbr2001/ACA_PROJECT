library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sub is
	Generic (
		TDATA_WIDTH		: positive := 32
	);
	Port (
		ap_clk			: in std_logic;
		ap_rst			: in std_logic;

        data_id         : in std_logic_vector(5 downto 0);

		s_axis_tvalid_a	: in std_logic;
		s_axis_tdata_a	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready_a	: out std_logic;

        s_axis_tvalid_b	: in std_logic;
		s_axis_tdata_b	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready_b	: out std_logic;

		m_axis_tvalid	: out std_logic;
		m_axis_tdata	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready	: in std_logic;

        mem_id          : in std_logic_vector(5 downto 0)
	);
end sub;

architecture Behavioral of sub is

    signal data_in_a 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal data_in_b 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');

    signal data_id_sgn      : std_logic_vector(5 downto 0) := (Others => '0');

    signal data_out 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');

    -------------  State variable -----------
    type state is (IDLE, RECEIVE,  SUB, SEND);  
    signal fsm_state : state := IDLE;
    -----------------------------------------

begin

    -- SLAVE --
    with fsm_state select s_axis_tready_a <= 
        '1' when RECEIVE,
        '0' when Others;

    with fsm_state select s_axis_tready_b <= 
        '1' when RECEIVE,
        '0' when Others;        
    
    -- MASTER --
    with fsm_state select m_axis_tvalid <=
        '1'	when SEND,
        '0' when Others;

    with fsm_state select m_axis_tdata <=
        data_out	    when SEND,  
        (others => '-')		when Others;

data_id_sgn <= data_id;

    FSM_SUB : process (ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then
    
                data_in_a 	    <= (Others => '0');
                data_in_b 		<= (Others => '0');

                data_out 		<= (Others => '0');

                fsm_state           <= IDLE;   
    
            else
    
                case (fsm_state) is	

                    When IDLE => 

                        fsm_state 			<= RECEIVE;

                    when RECEIVE =>	

                        if (s_axis_tvalid_a = '1' and s_axis_tvalid_b = '1') then

                            data_in_a	<= s_axis_tdata_a;
                            data_in_b	<= s_axis_tdata_b;

                            --data_id_sgn <= data_id;

                            fsm_state 		<= SUB;

                        else 

                            fsm_state 		<= RECEIVE;    -- Was expecting left value, if not drop the value and stay here

                        end if;
                                                                                                                                    
                    when SUB =>             
                        
                        data_out		        <= std_logic_vector(signed(data_in_a) - signed(data_in_b));
                        
                        fsm_state               <= SEND;

                    when SEND =>                                                                
                        
                        if (m_axis_tready = '1' and data_id_sgn = mem_id) then -- and controller is at the right position 
                                       	   
                            fsm_state           <= RECEIVE;

                        end if;

                    when Others =>        

                        fsm_state               <= IDLE;
                                                
                end case;
            end if;
        end if;
    end process;                                                              
end Behavioral;
