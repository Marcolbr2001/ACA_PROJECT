library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mul is
	Generic (
		TDATA_WIDTH		: positive := 32;
        DATA_LENGTH     : integer  := 1000
	);
	Port (
		ap_clk			: in std_logic;
		ap_rst			: in std_logic;

        ap_start        : in std_logic;
        ALU_start       : in std_logic;

        data_id         : in std_logic_vector(5 downto 0);

		s_axis_tvalid	: in std_logic;
		s_axis_tdata_a	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tdata_b	: in std_logic_vector(TDATA_WIDTH-1 downto 0);
		s_axis_tready	: out std_logic;

		m_axis_tvalid	: out std_logic;
		m_axis_tdata	: out std_logic_vector(TDATA_WIDTH-1 downto 0);
		m_axis_tready	: in std_logic;

        mem_id          : in std_logic_vector(5 downto 0)
	);
end mul;

architecture Behavioral of mul is

    signal data_in_a 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');
    signal data_in_b 		: std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');

    signal data_id_sgn      : std_logic_vector(5 downto 0) := (Others => '0');
    
    signal data_out 		: std_logic_vector(2*TDATA_WIDTH-1 downto 0) := (Others => '0');
 
    signal delay_count 		: integer range 0 to 9 := 0;

    -------------  State variable -----------
    type state is (IDLE, RECEIVE,  MUL, MUL_DELAY_1, SEND);  
     
    signal fsm_state : state := IDLE;
    -----------------------------------------



    -- A[15:8] x B[15:8] x2^16 +(A[15:8] x B[7:0] + A[7:0] x B[15:8] )x2^8 + A[7:0] x B[7:0]

    type p_operand is array(0 to 3) of signed( 7 downto 0);
    signal p_ma_hi       : p_operand;
    signal p_ma_lo       : p_operand;
    signal p_mb_hi       : p_operand;
    signal p_mb_lo       : p_operand;

    signal r_p1          : signed(17 downto 0);  -- 9x9 => 18 bit (16 + 2 sgn bit)
    signal r_p2          : signed(16 downto 0);  -- 8x9 => 17 bit (16 + 1 sgn bit)
    signal r_p3          : signed(16 downto 0);  -- 8x9 => 17 bit (16 + 1 sgn bit)
    signal r_p4          : signed(15 downto 0);  -- 8x8 => 16 bit

    signal r_m1          : signed(17 downto 0);  -- 9x9 => 18 bit (16 + 2 sgn bit)
    signal r_m2          : signed(16 downto 0);  -- 8x9 => 17 bit (16 + 1 sgn bit)
    signal r_m3          : signed(16 downto 0);  -- 8x9 => 17 bit (16 + 1 sgn bit)
    signal r_m4          : signed(15 downto 0);  -- 8x8 => 16 bit

    signal p_m1          : p_operand;  -- delay compensation
    signal p_m3          : signed(7 downto 0);  -- delay compensation

    signal o_m 		     : std_logic_vector(TDATA_WIDTH-1 downto 0) := (Others => '0');






begin



    o_m(31 downto 16)  <= std_logic_vector(r_m4(15 downto 0));
    o_m(15 downto  8)  <= std_logic_vector(p_m3);
    o_m( 7 downto  0)  <= std_logic_vector(p_m1(2));




    -- SLAVE --
    with fsm_state select s_axis_tready <= 
        '1' when RECEIVE,
        '0' when Others;     
    
    -- MASTER --
    m_axis_tvalid <= '1' when fsm_state = SEND and data_id_sgn = mem_id else '0'; 

    with fsm_state select m_axis_tdata <=
        o_m         	    when SEND,  
        (others => '-')		when Others;

    FSM_MUL : process (ap_clk)
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

                        if (ap_start = '1' and ALU_start = '1') then
                                
                            fsm_state 			<= RECEIVE;
                        
                        else
                            
                            fsm_state           <= IDLE;
                            
                        end if;

                    when RECEIVE =>	

                        if (unsigned(mem_id) = DATA_LENGTH) then
                        
                            data_id_sgn         <= (Others => '0');
                            fsm_state           <= IDLE;
                            
                        elsif (s_axis_tvalid = '1') then

                            data_in_a	    <= s_axis_tdata_a;
                            data_in_b	    <= s_axis_tdata_b;

                            data_id_sgn     <= data_id;

                            fsm_state 		<= MUL;

                        else 

                            fsm_state 		<= RECEIVE;

                        end if;
                                                                                                                                    
                    when MUL =>             
                        
                        --delay_1		        <= std_logic_vector(signed(data_in_a)*signed(data_in_b));
                        
                        if (delay_count = 9) then
                            
                            fsm_state           <= SEND;
                            delay_count         <= 0;

                        else


                            p_ma_hi       <= signed(data_in_a(15 downto 8))&p_ma_hi(0 to p_ma_hi'length-2);
                            p_ma_lo       <= signed(data_in_a( 7 downto 0))&p_ma_lo(0 to p_ma_lo'length-2);
                            p_mb_hi       <= signed(data_in_b(15 downto 8))&p_mb_hi(0 to p_mb_hi'length-2);
                            p_mb_lo       <= signed(data_in_b( 7 downto 0))&p_mb_lo(0 to p_mb_lo'length-2);
                            p_m1          <= r_m1(7 downto 0)&p_m1(0 to p_m1'length-2);
                            p_m3          <= r_m3(7 downto 0);

                            r_p1          <= signed('0'&p_ma_lo(0)) * signed('0'&p_mb_lo(0));
                            r_p2          <= signed('0'&p_ma_lo(1)) * p_mb_hi(1);
                            r_p3          <= p_ma_hi(2) * signed('0'&p_mb_lo(2));
                            r_p4          <= p_ma_hi(3) * p_mb_hi(3);

                            r_m1          <= r_p1;
                            r_m2          <= r_p2 + r_m1(16 downto 8);
                            r_m3          <= r_p3 + r_m2;
                            r_m4          <= r_p4 + r_m3(16 downto 8);

                            delay_count   <= delay_count + 1;

                        end if;


                    when SEND =>                                                                
                        
                        if (m_axis_tready = '1' and data_id_sgn = mem_id) then -- and controller is at the right position 
                                       	   
                            fsm_state       <= RECEIVE;

                        end if;

                    when Others =>        

                        fsm_state           <= IDLE;
                                                
                end case;
            end if;
        end if;
    end process;                                                              
end Behavioral;
