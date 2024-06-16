library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity fun_unit_sim is

end fun_unit_sim;

architecture Behavioral of fun_unit_sim is

    component sum
        port (ap_clk          : in std_logic;
              ap_rst          : in std_logic;
              data_id         : in std_logic_vector (5 downto 0);
              s_axis_tvalid_a : in std_logic;
              s_axis_tdata_a  : in std_logic_vector (32-1 downto 0);
              s_axis_tready_a : out std_logic;
              s_axis_tvalid_b : in std_logic;
              s_axis_tdata_b  : in std_logic_vector (32-1 downto 0);
              s_axis_tready_b : out std_logic;
              m_axis_tvalid   : out std_logic;
              m_axis_tdata    : out std_logic_vector (32-1 downto 0);
              m_axis_tready   : in std_logic;
              mem_id          : in std_logic_vector (5 downto 0));
    end component;

    signal ap_clk          : std_logic:='0';
    signal ap_rst          : std_logic:='1';
    signal data_id         : std_logic_vector (5 downto 0):=(Others=>'0');
    signal s_axis_tvalid_a : std_logic;
    signal s_axis_tdata_a  : std_logic_vector (32-1 downto 0):=(Others=>'0');
    signal s_axis_tready_a : std_logic;
    signal s_axis_tvalid_b : std_logic;
    signal s_axis_tdata_b  : std_logic_vector (32-1 downto 0):=(Others=>'0');
    signal s_axis_tready_b : std_logic;
    signal m_axis_tvalid   : std_logic;
    signal m_axis_tdata    : std_logic_vector (32-1 downto 0):=(Others=>'0');
    signal m_axis_tready   : std_logic;
    signal mem_id          : std_logic_vector (5 downto 0):=(Others=>'0');

begin

    dut : sum
    port map (ap_clk          => ap_clk,
              ap_rst          => ap_rst,
              data_id         => data_id,
              s_axis_tvalid_a => s_axis_tvalid_a,
              s_axis_tdata_a  => s_axis_tdata_a,
              s_axis_tready_a => s_axis_tready_a,
              s_axis_tvalid_b => s_axis_tvalid_b,
              s_axis_tdata_b  => s_axis_tdata_b,
              s_axis_tready_b => s_axis_tready_b,
              m_axis_tvalid   => m_axis_tvalid,
              m_axis_tdata    => m_axis_tdata,
              m_axis_tready   => m_axis_tready,
              mem_id          => mem_id);

    -- Clock generation
    ap_clk <= not ap_clk after 5ns;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        data_id <= (others => '0');
        s_axis_tvalid_a <= '0';
        s_axis_tdata_a <= (others => '0');
        s_axis_tvalid_b <= '0';
        s_axis_tdata_b <= (others => '0');
        m_axis_tready <= '0';
        mem_id <= (others => '0');

        -- Reset generation
        -- EDIT: Check that ap_rst is really your reset signal
        ap_rst <= '1';
        wait for 100 ns;
        ap_rst <= '0';
        m_axis_tready<='1';
        wait for 100 ns;
        
        
        mem_id<="000000";
        if (s_axis_tready_a='1') then
            data_id<="000100";
            s_axis_tvalid_a<='1';
            s_axis_tdata_a<=std_logic_vector(to_signed(1,32));
        else
            s_axis_tvalid_a<='0';
            s_axis_tdata_a<=std_logic_vector(to_signed(0,32));
        end if;
        if (s_axis_tready_b='1') then
            s_axis_tvalid_b<='1';
            s_axis_tdata_b<=std_logic_vector(to_signed(2,32));
        else
            s_axis_tvalid_b<='0';
            s_axis_tdata_b<=std_logic_vector(to_signed(0,32));
        end if;
        
        
        
        
        wait for 10ns;
        mem_id<="000001";
        if (s_axis_tready_a='1') then
            s_axis_tvalid_a<='1';
            s_axis_tdata_a<=std_logic_vector(to_signed(3,32));
        else
            s_axis_tvalid_a<='0';
            s_axis_tdata_a<=std_logic_vector(to_signed(0,32));
        end if;
        if (s_axis_tready_b='1') then
            s_axis_tvalid_b<='1';
            s_axis_tdata_b<=std_logic_vector(to_signed(4,32));
        else
            s_axis_tvalid_b<='0';
            s_axis_tdata_b<=std_logic_vector(to_signed(0,32));
        end if;
        
        wait for 10ns;
        mem_id<="000100";
        
     
        wait for 40ns;
        data_id<="001000";
        if (s_axis_tready_a='1') then
            s_axis_tvalid_a<='1';
            s_axis_tdata_a<=std_logic_vector(to_signed(5,32));
        else
            s_axis_tvalid_a<='0';
            s_axis_tdata_a<=std_logic_vector(to_signed(0,32));
        end if;
        if (s_axis_tready_b='1') then
            s_axis_tvalid_b<='1';
            s_axis_tdata_b<=std_logic_vector(to_signed(6,32));
        else
            s_axis_tvalid_b<='0';
            s_axis_tdata_b<=std_logic_vector(to_signed(0,32));
        end if;
        
        wait for 10ns;
        mem_id<="000100";
        wait for 10ns;
        mem_id<="000101";
        wait for 10ns;
        mem_id<="000110";
        wait for 10ns;
        mem_id<="001000";
        
        
        
        
        wait for 40ns;
        data_id<="001001";
        mem_id<="001001";
        if (s_axis_tready_a='1') then
            s_axis_tvalid_a<='1';
            s_axis_tdata_a<=std_logic_vector(to_signed(7,32));
        else
            s_axis_tvalid_a<='0';
            s_axis_tdata_a<=std_logic_vector(to_signed(0,32));
        end if;
        if (s_axis_tready_b='1') then
            s_axis_tvalid_b<='1';
            s_axis_tdata_b<=std_logic_vector(to_signed(8,32));
        else
            s_axis_tvalid_b<='0';
            s_axis_tdata_b<=std_logic_vector(to_signed(0,32));
        end if;
        
        
        
        
        
        wait for 40ns;
        data_id<="001101";
        mem_id<="001101";
        if (s_axis_tready_a='1') then
            s_axis_tvalid_a<='1';
            s_axis_tdata_a<=std_logic_vector(to_signed(9,32));
        else
            s_axis_tvalid_a<='0';
            s_axis_tdata_a<=std_logic_vector(to_signed(0,32));
        end if;
        if (s_axis_tready_b='1') then
            s_axis_tvalid_b<='1';
            s_axis_tdata_b<=std_logic_vector(to_signed(10,32));
        else
            s_axis_tvalid_b<='0';
            s_axis_tdata_b<=std_logic_vector(to_signed(0,32));
        end if;
        
        
        
        
        
        wait for 40ns;
        data_id<="101101";
        mem_id<="101001";
        if (s_axis_tready_a='1') then
            s_axis_tvalid_a<='1';
            s_axis_tdata_a<=std_logic_vector(to_signed(11,32));
        else
            s_axis_tvalid_a<='0';
            s_axis_tdata_a<=std_logic_vector(to_signed(0,32));
        end if;
        if (s_axis_tready_b='1') then
            s_axis_tvalid_b<='1';
            s_axis_tdata_b<=std_logic_vector(to_signed(12,32));
        else
            s_axis_tvalid_b<='0';
            s_axis_tdata_b<=std_logic_vector(to_signed(0,32));
        end if;
        wait for 10ns;
        mem_id<="101101";
        wait;
    end process;

end Behavioral;
