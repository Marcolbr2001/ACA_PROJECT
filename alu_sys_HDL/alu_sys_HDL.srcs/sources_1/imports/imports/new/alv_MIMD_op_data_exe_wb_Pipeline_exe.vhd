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

    signal data_a : STD_LOGIC_VECTOR (31 downto 0);                         -- Signal of input data_a
    signal data_b : STD_LOGIC_VECTOR (31 downto 0);                         -- Signal of input data_b
    
    signal data_result_sgn : STD_LOGIC_VECTOR (31 downto 0);                -- Output register for storing ALU result
    signal data_result_sgn_2 : STD_LOGIC_VECTOR (63 downto 0);                -- Output register for storing ALU result
    
    signal m_axis_tvalid_sum : std_logic := '0';
    signal m_axis_tdata_sum_1 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tdata_sum_2 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tready_sum : std_logic := '0';
    signal s_axis_tready_sum_a: std_logic;
    signal s_axis_tready_sum_b: std_logic; 
    signal s_axis_tready_sub_a: std_logic;
    signal s_axis_tready_sub_b: std_logic;
    signal s_axis_tready_mul_a: std_logic;
    signal s_axis_tready_mul_b: std_logic;
    signal s_axis_tready_div_a: std_logic;
    signal s_axis_tready_div_b: std_logic;
    
    signal m_axis_tvalid_sub : std_logic := '0';
    signal m_axis_tdata_sub_1 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tdata_sub_2 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tready_sub : std_logic := '0';
    
    signal m_axis_tvalid_mul : std_logic := '0';
    signal m_axis_tdata_mul_1 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tdata_mul_2 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tready_mul : std_logic := '0';
    
    signal m_axis_tvalid_div : std_logic := '0';
    signal m_axis_tdata_div_1 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tdata_div_2 : std_logic_vector (31 downto 0) := (Others=>'0');
    signal m_axis_tready_div : std_logic := '0';
    
    
    
    
    
    signal FU_sum_m_axis_tvalid : STD_LOGIC:='0';
    signal FU_sum_m_axis_tdata  : STD_LOGIC_VECTOR (31 downto 0) := (Others=>'0');
    signal FU_sum_m_axis_tready : STD_LOGIC:='0';

    signal FU_sub_m_axis_tvalid : STD_LOGIC:='0';
    signal FU_sub_m_axis_tdata  : STD_LOGIC_VECTOR (31 downto 0) := (Others=>'0');
    signal FU_sub_m_axis_tready : STD_LOGIC:='0';

    signal FU_mul_m_axis_tvalid : STD_LOGIC:='0';
    signal FU_mul_m_axis_tdata  : STD_LOGIC_VECTOR (31 downto 0) := (Others=>'0');
    signal FU_mul_m_axis_tready : STD_LOGIC:='0';

    signal FU_div_m_axis_tvalid : STD_LOGIC:='0';
    signal FU_div_m_axis_tdata  : STD_LOGIC_VECTOR (31 downto 0) := (Others=>'0');
    signal FU_div_m_axis_tready : STD_LOGIC:='0';
    
    signal data_id_sum          : std_logic_vector (5 downto 0) := (Others=>'0');
    signal data_id_sub          : std_logic_vector (5 downto 0) := (Others=>'0');
    signal data_id_mul          : std_logic_vector (5 downto 0) := (Others=>'0');
    signal data_id_div          : std_logic_vector (5 downto 0) := (Others=>'0');
    

    signal counter : STD_LOGIC_VECTOR (5 downto 0):= (Others=>'0');
    signal ALU_operation_MEM_address0_sgn : STD_LOGIC_VECTOR (5 downto 0):= (Others=>'0');  -- Signal of RAM address (operations are stored here)

    signal data_not_empty : std_logic := '0';                               -- Signal that guarantees both FIFOs are not empty  

    -------------  State variable -----------
    type state is (IDLE, DATA_REQUEST, RECEIVE_DATA, COMPUTATION, SEND_DATA);  
    signal exe_state : state := IDLE;
    -----------------------------------------


    component sum is
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
    end component;

    component sub is
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
    end component;

    component mul is
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
    end component;

    component div is
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
    end component;

    component pp_buf is
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
    end component;

begin

    m_axis_tready_sum<=s_axis_tready_sum_a and s_axis_tready_sum_b;
    m_axis_tready_sub<=s_axis_tready_sub_a and s_axis_tready_sub_b;
    m_axis_tready_mul<=s_axis_tready_mul_a and s_axis_tready_mul_b;
    m_axis_tready_div<=s_axis_tready_div_a and s_axis_tready_div_b;

    block_sum : sum 
        
        Port Map (
            ap_clk			=>ap_clk,
            ap_rst			=>ap_rst,
    
            data_id         =>data_id_sum,
    
            s_axis_tvalid_a	=>m_axis_tvalid_sum,
            s_axis_tdata_a	=>m_axis_tdata_sum_1,
            s_axis_tready_a	=>s_axis_tready_sum_a,

            s_axis_tvalid_b	=>m_axis_tvalid_sum,
            s_axis_tdata_b	=>m_axis_tdata_sum_2,
            s_axis_tready_b	=>s_axis_tready_sum_b,
    
            m_axis_tvalid	=>FU_sum_m_axis_tvalid,
            m_axis_tdata	=>FU_sum_m_axis_tdata,
            m_axis_tready	=>FU_sum_m_axis_tready,
    
            mem_id          =>counter
        );
    
    block_sub : sub 

        Port Map(
            ap_clk			=>ap_clk,
            ap_rst			=>ap_rst,
    
            data_id         =>data_id_sub,
    
            s_axis_tvalid_a	=>m_axis_tvalid_sub,
            s_axis_tdata_a	=>m_axis_tdata_sub_1,
            s_axis_tready_a	=>s_axis_tready_sub_a,

            s_axis_tvalid_b	=>m_axis_tvalid_sub,
            s_axis_tdata_b	=>m_axis_tdata_sub_2,
            s_axis_tready_b	=>s_axis_tready_sub_b,
    
            m_axis_tvalid	=>FU_sub_m_axis_tvalid,
            m_axis_tdata	=>FU_sub_m_axis_tdata,
            m_axis_tready	=>FU_sub_m_axis_tready,
    
            mem_id          =>counter
        );
        
        

    block_mul : mul

        Port Map(
            ap_clk			=>ap_clk,
            ap_rst			=>ap_rst,
    
            data_id         =>data_id_mul,
    
            s_axis_tvalid_a	=>m_axis_tvalid_mul,
            s_axis_tdata_a	=>m_axis_tdata_mul_1,
            s_axis_tready_a	=>s_axis_tready_mul_a,
    
            s_axis_tvalid_b	=>m_axis_tvalid_mul,
            s_axis_tdata_b	=>m_axis_tdata_mul_2,
            s_axis_tready_b	=>s_axis_tready_mul_b,
    
            m_axis_tvalid	=>FU_mul_m_axis_tvalid,
            m_axis_tdata	=>FU_mul_m_axis_tdata,
            m_axis_tready	=>FU_mul_m_axis_tready,
    
            mem_id          =>counter
        );

    block_div : div

        Port Map(
            ap_clk			=>ap_clk,
            ap_rst			=>ap_rst,
    
            data_id         =>data_id_div,
    
            s_axis_tvalid_a	=>m_axis_tvalid_div,
            s_axis_tdata_a	=>m_axis_tdata_div_1,
            s_axis_tready_a	=>s_axis_tready_div_a,
    
            s_axis_tvalid_b	=>m_axis_tvalid_div,
            s_axis_tdata_b	=>m_axis_tdata_div_2,
            s_axis_tready_b	=>s_axis_tready_div_b,
    
            m_axis_tvalid	=> FU_div_m_axis_tvalid,
            m_axis_tdata	=> FU_div_m_axis_tdata,
            m_axis_tready	=> FU_div_m_axis_tready,
    
            mem_id          =>counter
        );

    ping_pong_buffer : pp_buf

        Port Map(
            ap_clk			=>ap_clk,
            ap_rst			=>ap_rst,
            ap_idle         =>ap_idle,
            ap_start        =>ap_start,
            ap_ready        =>ap_ready,
    
            s_axis_tvalid_a	=>data_a_empty_n,
            s_axis_tdata_a	=>data_a_dout,
            s_axis_tready_a =>data_a_read,
    
            s_axis_tvalid_b	=>data_b_empty_n,
            s_axis_tdata_b	=>data_b_dout,
            s_axis_tready_b	=>data_b_read,
    
            m_axis_tvalid_sum	=>m_axis_tvalid_sum,
            m_axis_tdata_sum_1	=>m_axis_tdata_sum_1,
            m_axis_tdata_sum_2	=>m_axis_tdata_sum_2,
            m_axis_tready_sum	=>m_axis_tready_sum,
    
            m_axis_tvalid_sub	=>m_axis_tvalid_sub,
            m_axis_tdata_sub_1	=>m_axis_tdata_sub_1,
            m_axis_tdata_sub_2	=>m_axis_tdata_sub_2,
            m_axis_tready_sub	=>m_axis_tready_sub,
    
            m_axis_tvalid_mul	=>m_axis_tvalid_mul,
            m_axis_tdata_mul_1	=>m_axis_tdata_mul_1,
            m_axis_tdata_mul_2	=>m_axis_tdata_mul_2,
            m_axis_tready_mul	=>m_axis_tready_mul,
    
            m_axis_tvalid_div	=>m_axis_tvalid_div,
            m_axis_tdata_div_1	=>m_axis_tdata_div_1,
            m_axis_tdata_div_2	=>m_axis_tdata_div_2,
            m_axis_tready_div	=>m_axis_tready_div,
    
            RAM_value           =>ALU_operation_MEM_q0,
            RAM_address         => ALU_operation_MEM_address0_sgn,
    
            data_id_sum         =>data_id_sum,
            data_id_sub         =>data_id_sub,
            data_id_mul         =>data_id_mul,
            data_id_div         =>data_id_div
    
        );

    -----------------------------------------------------------------------------

    ALU_operation_MEM_ce0       <= '1';                                 -- Keep always enabled the register at the RAM output
    ALU_operation_MEM_address0  <= ALU_operation_MEM_address0_sgn;
    
    ap_done <= '1' when ((unsigned(ALU_operation_MEM_address0_sgn) = DATA_LENGTH - 1)) else '0';

    MEM : process (ap_clk)
    begin
        if rising_edge(ap_clk) then
            if (ap_rst = '1') then
    
--                data_a              <= (Others => '0');
--                data_b              <= (Others => '0');
                
--                data_id_sum 	    <= (Others => '0');
--                data_id_sub 		<= (Others => '0');
--                data_id_mul 	    <= (Others => '0');
--                data_id_div 		<= (Others => '0');

--                m_axis_tdata_sum_1 	<= (Others => '0');
--                m_axis_tdata_sum_2 	<= (Others => '0');
--                m_axis_tdata_sub_1 	<= (Others => '0');
--                m_axis_tdata_sub_2 	<= (Others => '0');
--                m_axis_tdata_mul_1 	<= (Others => '0');
--                m_axis_tdata_mul_2 	<= (Others => '0');
--                m_axis_tdata_div_1 	<= (Others => '0');
--                m_axis_tdata_div_2 	<= (Others => '0');
--                FU_sum_m_axis_tdata <= (Others => '0');
--                FU_sub_m_axis_tdata <= (Others => '0');
--                FU_mul_m_axis_tdata <= (Others => '0');
--                FU_div_m_axis_tdata <= (Others => '0');
                
--                ALU_operation_MEM_address0_sgn 	<= (Others => '0');
                
                
                
    
            else
                
                if (FU_sum_m_axis_tvalid = '1' and FU_sum_m_axis_tready = '1' and counter = data_id_sum) then
                    
                    data_result_write<='1';
                    data_result_din <= FU_sum_m_axis_tdata;
                    counter <= std_logic_vector(unsigned(counter)+ 1);

                elsif (FU_sub_m_axis_tvalid = '1' and FU_sub_m_axis_tready = '1' and counter = data_id_sub) then
                    
                    data_result_write<='1';
                    data_result_din <= FU_sub_m_axis_tdata;
                    counter <= std_logic_vector(unsigned(counter)+ 1);

                elsif (FU_mul_m_axis_tvalid = '1' and FU_mul_m_axis_tready = '1' and counter = data_id_mul) then

                    data_result_write<='1';
                    data_result_din <= FU_mul_m_axis_tdata;  
                    counter <= std_logic_vector(unsigned(counter)+ 1);

                elsif (FU_div_m_axis_tvalid = '1' and FU_div_m_axis_tready = '1' and counter = data_id_div) then
                    
                    data_result_write<='1';
                    data_result_din <= FU_div_m_axis_tdata; 
                    counter <= std_logic_vector(unsigned(counter)+ 1);
                
                else
                    data_result_write<='0';
                end if;
                                
            end if;
        end if;
    end process;               

    FU_sum_m_axis_tready <= data_result_full_n;
    FU_sub_m_axis_tready <= data_result_full_n;
    FU_mul_m_axis_tready <= data_result_full_n;
    FU_div_m_axis_tready <= data_result_full_n;


--data_result_write<='1' when ((FU_sum_m_axis_tvalid = '1' and FU_sum_m_axis_tready = '1')or(FU_sub_m_axis_tvalid = '1' and FU_sub_m_axis_tready = '1')or(FU_mul_m_axis_tvalid = '1' and FU_mul_m_axis_tready = '1')or(FU_div_m_axis_tvalid = '1' and FU_div_m_axis_tready = '1')) else '0';

end behav;
