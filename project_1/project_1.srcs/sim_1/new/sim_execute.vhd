-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.5.2024 08:11:00 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_alv_MIMD_op_data_exe_wb_Pipeline_exe is
end tb_alv_MIMD_op_data_exe_wb_Pipeline_exe;

architecture tb of tb_alv_MIMD_op_data_exe_wb_Pipeline_exe is

    component alv_MIMD_op_data_exe_wb_Pipeline_exe
        port (ap_clk                     : in std_logic;
              ap_rst                     : in std_logic;
              ap_start                   : in std_logic;
              ap_done                    : out std_logic;
              ap_idle                    : out std_logic;
              ap_ready                   : out std_logic;
              data_a_dout                : in std_logic_vector (31 downto 0);
              data_a_empty_n             : in std_logic;
              data_a_read                : out std_logic;
              data_b_dout                : in std_logic_vector (31 downto 0);
              data_b_empty_n             : in std_logic;
              data_b_read                : out std_logic;
              data_result_din            : out std_logic_vector (31 downto 0);
              data_result_full_n         : in std_logic;
              data_result_write          : out std_logic;
              ALU_operation_MEM_address0 : out std_logic_vector (5 downto 0);
              ALU_operation_MEM_ce0      : out std_logic;
              ALU_operation_MEM_q0       : in std_logic_vector (31 downto 0));
    end component;

    signal ap_clk                     : std_logic;
    signal ap_rst                     : std_logic:='0';
    signal ap_start                   : std_logic;
    signal ap_done                    : std_logic;
    signal ap_idle                    : std_logic;
    signal ap_ready                   : std_logic;
    signal data_a_dout                : std_logic_vector (31 downto 0);
    signal data_a_empty_n             : std_logic:='1';
    signal data_a_read                : std_logic;
    signal data_b_dout                : std_logic_vector (31 downto 0);
    signal data_b_empty_n             : std_logic:='1';
    signal data_b_read                : std_logic;
    signal data_result_din            : std_logic_vector (31 downto 0);
    signal data_result_full_n         : std_logic:='1';
    signal data_result_write          : std_logic;
    signal ALU_operation_MEM_address0 : std_logic_vector (5 downto 0);
    signal ALU_operation_MEM_ce0      : std_logic;
    signal ALU_operation_MEM_q0       : std_logic_vector (31 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';
    
    
    signal i : integer :=0;

begin

    dut : alv_MIMD_op_data_exe_wb_Pipeline_exe
    port map (ap_clk                     => ap_clk,
              ap_rst                     => ap_rst,
              ap_start                   => ap_start,
              ap_done                    => ap_done,
              ap_idle                    => ap_idle,
              ap_ready                   => ap_ready,
              data_a_dout                => data_a_dout,
              data_a_empty_n             => data_a_empty_n,
              data_a_read                => data_a_read,
              data_b_dout                => data_b_dout,
              data_b_empty_n             => data_b_empty_n,
              data_b_read                => data_b_read,
              data_result_din            => data_result_din,
              data_result_full_n         => data_result_full_n,
              data_result_write          => data_result_write,
              ALU_operation_MEM_address0 => ALU_operation_MEM_address0,
              ALU_operation_MEM_ce0      => ALU_operation_MEM_ce0,
              ALU_operation_MEM_q0       => ALU_operation_MEM_q0);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that ap_clk is really your main clock signal
    ap_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
            ap_start <= '1';
       wait for 10 ns;
            ap_start <= '0';
            ap_rst <= '1';
            data_a_empty_n <= '1';
            data_b_empty_n <= '0';
            data_result_full_n <= '0';
        -- Reset generation
        -- EDIT: Check that ap_rst is really your reset signal
        wait;
    end process;

process(ap_clk)
begin
    if(rising_edge(ap_clk)) then
        if(i=9) then
            i<=0; 
        else
            i<=i+1;  
        end if;
        
        ALU_operation_MEM_q0<=std_logic_vector(to_unsigned(i,32));
        data_a_dout<=std_logic_vector(to_unsigned(i,32));
        data_b_dout<=std_logic_vector(to_unsigned(9-i,32));
        
        
    end if;
end process;


end tb;


-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_alv_MIMD_op_data_exe_wb_Pipeline_exe of tb_alv_MIMD_op_data_exe_wb_Pipeline_exe is
    for tb
    end for;
end cfg_tb_alv_MIMD_op_data_exe_wb_Pipeline_exe;