--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Sat Jun 22 22:16:15 2024
--Host        : MSI running 64-bit major release  (build 9200)
--Command     : generate_target bd_0.bd
--Design      : bd_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axi_control_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_arready : out STD_LOGIC;
    s_axi_control_arvalid : in STD_LOGIC;
    s_axi_control_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_awready : out STD_LOGIC;
    s_axi_control_awvalid : in STD_LOGIC;
    s_axi_control_bready : in STD_LOGIC;
    s_axi_control_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_bvalid : out STD_LOGIC;
    s_axi_control_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_rready : in STD_LOGIC;
    s_axi_control_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_rvalid : out STD_LOGIC;
    s_axi_control_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_wready : out STD_LOGIC;
    s_axi_control_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_wvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_0 : entity is "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_0 : entity is "bd_0.hwdef";
end bd_0;

architecture STRUCTURE of bd_0 is
  component bd_0_hls_inst_0 is
  port (
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC
  );
  end component bd_0_hls_inst_0;
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal hls_inst_interrupt : STD_LOGIC;
  signal s_axi_control_0_1_ARADDR : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal s_axi_control_0_1_ARREADY : STD_LOGIC;
  signal s_axi_control_0_1_ARVALID : STD_LOGIC;
  signal s_axi_control_0_1_AWADDR : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal s_axi_control_0_1_AWREADY : STD_LOGIC;
  signal s_axi_control_0_1_AWVALID : STD_LOGIC;
  signal s_axi_control_0_1_BREADY : STD_LOGIC;
  signal s_axi_control_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_control_0_1_BVALID : STD_LOGIC;
  signal s_axi_control_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_control_0_1_RREADY : STD_LOGIC;
  signal s_axi_control_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_control_0_1_RVALID : STD_LOGIC;
  signal s_axi_control_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_control_0_1_WREADY : STD_LOGIC;
  signal s_axi_control_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axi_control_0_1_WVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH";
  attribute X_INTERFACE_INFO of s_axi_control_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_PARAMETER of s_axi_control_araddr : signal is "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of s_axi_control_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
begin
  ap_clk_0_1 <= ap_clk;
  ap_rst_n_0_1 <= ap_rst_n;
  interrupt <= hls_inst_interrupt;
  s_axi_control_0_1_ARADDR(5 downto 0) <= s_axi_control_araddr(5 downto 0);
  s_axi_control_0_1_ARVALID <= s_axi_control_arvalid;
  s_axi_control_0_1_AWADDR(5 downto 0) <= s_axi_control_awaddr(5 downto 0);
  s_axi_control_0_1_AWVALID <= s_axi_control_awvalid;
  s_axi_control_0_1_BREADY <= s_axi_control_bready;
  s_axi_control_0_1_RREADY <= s_axi_control_rready;
  s_axi_control_0_1_WDATA(31 downto 0) <= s_axi_control_wdata(31 downto 0);
  s_axi_control_0_1_WSTRB(3 downto 0) <= s_axi_control_wstrb(3 downto 0);
  s_axi_control_0_1_WVALID <= s_axi_control_wvalid;
  s_axi_control_arready <= s_axi_control_0_1_ARREADY;
  s_axi_control_awready <= s_axi_control_0_1_AWREADY;
  s_axi_control_bresp(1 downto 0) <= s_axi_control_0_1_BRESP(1 downto 0);
  s_axi_control_bvalid <= s_axi_control_0_1_BVALID;
  s_axi_control_rdata(31 downto 0) <= s_axi_control_0_1_RDATA(31 downto 0);
  s_axi_control_rresp(1 downto 0) <= s_axi_control_0_1_RRESP(1 downto 0);
  s_axi_control_rvalid <= s_axi_control_0_1_RVALID;
  s_axi_control_wready <= s_axi_control_0_1_WREADY;
hls_inst: component bd_0_hls_inst_0
     port map (
      ap_clk => ap_clk_0_1,
      ap_rst_n => ap_rst_n_0_1,
      interrupt => hls_inst_interrupt,
      s_axi_control_ARADDR(5 downto 0) => s_axi_control_0_1_ARADDR(5 downto 0),
      s_axi_control_ARREADY => s_axi_control_0_1_ARREADY,
      s_axi_control_ARVALID => s_axi_control_0_1_ARVALID,
      s_axi_control_AWADDR(5 downto 0) => s_axi_control_0_1_AWADDR(5 downto 0),
      s_axi_control_AWREADY => s_axi_control_0_1_AWREADY,
      s_axi_control_AWVALID => s_axi_control_0_1_AWVALID,
      s_axi_control_BREADY => s_axi_control_0_1_BREADY,
      s_axi_control_BRESP(1 downto 0) => s_axi_control_0_1_BRESP(1 downto 0),
      s_axi_control_BVALID => s_axi_control_0_1_BVALID,
      s_axi_control_RDATA(31 downto 0) => s_axi_control_0_1_RDATA(31 downto 0),
      s_axi_control_RREADY => s_axi_control_0_1_RREADY,
      s_axi_control_RRESP(1 downto 0) => s_axi_control_0_1_RRESP(1 downto 0),
      s_axi_control_RVALID => s_axi_control_0_1_RVALID,
      s_axi_control_WDATA(31 downto 0) => s_axi_control_0_1_WDATA(31 downto 0),
      s_axi_control_WREADY => s_axi_control_0_1_WREADY,
      s_axi_control_WSTRB(3 downto 0) => s_axi_control_0_1_WSTRB(3 downto 0),
      s_axi_control_WVALID => s_axi_control_0_1_WVALID
    );
end STRUCTURE;
