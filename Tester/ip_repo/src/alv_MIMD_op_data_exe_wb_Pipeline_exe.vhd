library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alv_MIMD_op_data_exe_wb_Pipeline_exe is
generic(
    DATA_LENGTH : integer := 50
);
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;

    data_a_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    data_a_empty_n : IN STD_LOGIC;
    data_a_read : OUT STD_LOGIC;

    data_b_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    data_b_empty_n : IN STD_LOGIC;
    data_b_read : OUT STD_LOGIC;

    data_result_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    data_result_full_n : IN STD_LOGIC;
    data_result_write : OUT STD_LOGIC;

    ALU_operation_MEM_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    ALU_operation_MEM_ce0 : OUT STD_LOGIC;
    ALU_operation_MEM_q0 : IN STD_LOGIC_VECTOR (31 downto 0) 
    );
end;

architecture behav of alv_MIMD_op_data_exe_wb_Pipeline_exe is 

    -------------  State variable -----------
    type state is (IDLE, DATA_REQUEST, RECEIVE_DATA, EXECUTION, SEND_DATA);  
    signal exe_state : state := IDLE;
    -----------------------------------------

    signal data_a : STD_LOGIC_VECTOR (31 downto 0);
    signal data_b : STD_LOGIC_VECTOR (31 downto 0);
    
    signal data_result_sgn : STD_LOGIC_VECTOR (31 downto 0);
    
    signal ALU_operation_MEM_address0_sgn : STD_LOGIC_VECTOR (5 downto 0);

    signal data_not_empty : std_logic := '0';

begin

    ALU_operation_MEM_ce0       <= '1';                                 -- always activate register at the RAM output
    data_not_empty              <= data_a_empty_n nor data_b_empty_n;   -- vedere se le fifo hanno dati
    ALU_operation_MEM_address0  <= ALU_operation_MEM_address0_sgn;

    with exe_state select ap_ready <= 
        '1' when RECEIVE_DATA,
        '0' when Others;

    with exe_state select ap_idle <= 
        '1' when IDLE,
        '0' when Others;

    with exe_state select data_result_write <= 
        '1' when SEND_DATA,
        '0' when Others;

    ap_done <= '1' when ((exe_state = SEND_DATA) and (data_result_full_n = '0') and (unsigned(ALU_operation_MEM_address0_sgn) = DATA_LENGTH - 1)) else '0';
        

    with exe_state select data_result_din <=
        data_result_sgn	    when SEND_DATA,  
        (others => '-')		when Others;

    exe_engine : process(ap_clk)
    begin

        if rising_edge(ap_clk) then
            
            if ap_rst = '1' then
            
                ALU_operation_MEM_address0_sgn <= (Others => '0');

                exe_state   <= IDLE;

            else

                case(exe_state) is

                    when IDLE =>

                        if (ap_start = '1') then

                            exe_state <= DATA_REQUEST;

                        end if;

                    when DATA_REQUEST =>

                        data_a_read <= '1';
                        data_b_read <= '1';

                        exe_state   <= RECEIVE_DATA; 

                    when RECEIVE_DATA =>

                        if (data_not_empty = '1') then

                            data_a <= data_a_dout;
                            data_b <= data_b_dout;

                            data_a_read <= '0'; -- Do not Read FIFO Anymore
                            data_b_read <= '0';

                            exe_state <= EXECUTION;

                        else

                            exe_state <= DATA_REQUEST;

                        end if;

                    when EXECUTION =>

                        if (ALU_operation_MEM_q0 = "00000000000000000000000000000000") then 

                            data_result_sgn <= std_logic_vector(signed(data_a) + signed(data_b));

                        else
                            
                            data_result_sgn <= std_logic_vector(signed(data_a) - signed(data_b));

                        end if;

                        exe_state <= SEND_DATA;

                    when SEND_DATA =>

                            if (data_result_full_n = '0') then -- if not full
                                
                                if (unsigned(ALU_operation_MEM_address0_sgn) = DATA_LENGTH - 1) then -- Read Next Operation in RAM
                                    
                                    ALU_operation_MEM_address0_sgn <= (Others => '0');

                                    exe_state <= IDLE;

                                else

                                    ALU_operation_MEM_address0_sgn <= std_logic_vector(unsigned(ALU_operation_MEM_address0_sgn) + 1);

                                    exe_state <= DATA_REQUEST;

                                end if;

                            
                            else
                            
                                exe_state <= SEND_DATA;
                            
                            end if;

                    when others =>

                end case;

            end if;

        end if;

    end process;

end behav;
