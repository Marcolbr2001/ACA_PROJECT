library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alv_VHDL_op_data_exe_wb_Pipeline_exe is
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

architecture behav of alv_VHDL_op_data_exe_wb_Pipeline_exe is 

    signal data_a : STD_LOGIC_VECTOR (31 downto 0);                         -- Signal of input data_a
    signal data_b : STD_LOGIC_VECTOR (31 downto 0);                         -- Signal of input data_b
    
    signal data_result_sgn : STD_LOGIC_VECTOR (31 downto 0);                -- Output register for storing ALU result
    
    signal ALU_operation_MEM_address0_sgn : STD_LOGIC_VECTOR (5 downto 0);  -- Signal of RAM address (operations are stored here)

    signal data_not_empty : std_logic := '0';                               -- Signal that guarantees both FIFOs are not empty  

    -------------  State variable -----------
    type state is (IDLE, DATA_REQUEST, RECEIVE_DATA, COMPUTATION, SEND_DATA);  
    signal exe_state : state := IDLE;
    -----------------------------------------

begin

    ALU_operation_MEM_ce0       <= '1';                                 -- Keep always enabled the register at the RAM output

    data_not_empty              <= data_a_empty_n and data_b_empty_n;   -- Check if both FIFOs are not empty 

    ALU_operation_MEM_address0  <= ALU_operation_MEM_address0_sgn;      -- Output current RAM address

    with exe_state select data_result_write <=      -- Immediately tell to output FIFO that has to be written
        '1' when SEND_DATA,
        '0' when Others;
        
    with exe_state select data_result_din <=        -- Immediately output data when FSM is in SEND_DATA
        data_result_sgn	    when SEND_DATA,  
        (others => '-')		when Others;
    
    with exe_state select ap_ready <=               -- FSM is ready to accept data when in RECEIVE_DATA
        '1' when RECEIVE_DATA,
        '0' when Others;

    with exe_state select ap_idle <=                -- ap_idle is asserted when FSM is in IDLE state, ALU goes in IDLE when a burst has been completed
        '1' when IDLE,
        '0' when Others;

    -- ap_done is asserted when FSM is in SEND_DATA and a burst has been completed
    ap_done <= '1' when ((exe_state = SEND_DATA) and ((data_result_full_n = '0') or (unsigned(ALU_operation_MEM_address0_sgn) = DATA_LENGTH - 1))) else '0';

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

                    when DATA_REQUEST =>                -- Inform both FIFOs that have to be read

                        data_a_read <= '1';
                        data_b_read <= '1';

                        exe_state   <= RECEIVE_DATA; 

                    when RECEIVE_DATA =>                -- Store FIFOs data in registers, then go to computation 

                        if (data_not_empty = '1') then

                            data_a <= data_a_dout;
                            data_b <= data_b_dout;

                            data_a_read <= '0'; -- Do not Read FIFO "a" Anymore
                            data_b_read <= '0'; -- Do not Read FIFO "b" Anymore

                            exe_state <= COMPUTATION;

                        else

                            exe_state <= DATA_REQUEST;

                        end if;

                    when COMPUTATION =>                 -- Compute a sum or a subtraction depending on current RAM cell value

                        if (ALU_operation_MEM_q0 = "00000000000000000000000000000000") then 

                            data_result_sgn <= std_logic_vector(signed(data_a) + signed(data_b));
                            
                        else
                            
                            data_result_sgn <= std_logic_vector(signed(data_a) - signed(data_b));

                        end if;

                        exe_state <= SEND_DATA;

                    when SEND_DATA =>                   -- Send data to output FIFO

                            if (data_result_full_n = '1') then -- if output FIFO is not full store result into it
                                
                                if (unsigned(ALU_operation_MEM_address0_sgn) = DATA_LENGTH - 1) then    -- Burst is completed, reset RAM index to top (0)
                                    
                                    ALU_operation_MEM_address0_sgn <= (Others => '0');

                                    exe_state <= IDLE;

                                else                                                                    -- If burst is not completed, read next operation in RAM

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
