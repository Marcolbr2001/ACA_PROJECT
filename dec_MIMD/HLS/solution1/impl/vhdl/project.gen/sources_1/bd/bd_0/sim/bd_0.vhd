--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Tue Apr 23 23:12:49 2024
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
    m_axi_gmem0_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem0_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_arready : in STD_LOGIC;
    m_axi_gmem0_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_arvalid : out STD_LOGIC;
    m_axi_gmem0_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem0_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_awready : in STD_LOGIC;
    m_axi_gmem0_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_awvalid : out STD_LOGIC;
    m_axi_gmem0_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_bready : out STD_LOGIC;
    m_axi_gmem0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_bvalid : in STD_LOGIC;
    m_axi_gmem0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem0_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_rlast : in STD_LOGIC;
    m_axi_gmem0_rready : out STD_LOGIC;
    m_axi_gmem0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_rvalid : in STD_LOGIC;
    m_axi_gmem0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem0_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_wlast : out STD_LOGIC;
    m_axi_gmem0_wready : in STD_LOGIC;
    m_axi_gmem0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_wvalid : out STD_LOGIC;
    m_axi_gmem1_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem1_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem1_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_arready : in STD_LOGIC;
    m_axi_gmem1_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_arvalid : out STD_LOGIC;
    m_axi_gmem1_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem1_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem1_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_awready : in STD_LOGIC;
    m_axi_gmem1_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_awvalid : out STD_LOGIC;
    m_axi_gmem1_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_bready : out STD_LOGIC;
    m_axi_gmem1_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_bvalid : in STD_LOGIC;
    m_axi_gmem1_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem1_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_rlast : in STD_LOGIC;
    m_axi_gmem1_rready : out STD_LOGIC;
    m_axi_gmem1_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_rvalid : in STD_LOGIC;
    m_axi_gmem1_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem1_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_wlast : out STD_LOGIC;
    m_axi_gmem1_wready : in STD_LOGIC;
    m_axi_gmem1_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_wvalid : out STD_LOGIC;
    m_axi_gmem2_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem2_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem2_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_arready : in STD_LOGIC;
    m_axi_gmem2_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_arvalid : out STD_LOGIC;
    m_axi_gmem2_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem2_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem2_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_awready : in STD_LOGIC;
    m_axi_gmem2_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_awvalid : out STD_LOGIC;
    m_axi_gmem2_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_bready : out STD_LOGIC;
    m_axi_gmem2_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_bvalid : in STD_LOGIC;
    m_axi_gmem2_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem2_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_rlast : in STD_LOGIC;
    m_axi_gmem2_rready : out STD_LOGIC;
    m_axi_gmem2_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_rvalid : in STD_LOGIC;
    m_axi_gmem2_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem2_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_wlast : out STD_LOGIC;
    m_axi_gmem2_wready : in STD_LOGIC;
    m_axi_gmem2_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_wvalid : out STD_LOGIC;
    m_axi_gmem3_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem3_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem3_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_arready : in STD_LOGIC;
    m_axi_gmem3_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_arvalid : out STD_LOGIC;
    m_axi_gmem3_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem3_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem3_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_awready : in STD_LOGIC;
    m_axi_gmem3_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_awvalid : out STD_LOGIC;
    m_axi_gmem3_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_bready : out STD_LOGIC;
    m_axi_gmem3_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_bvalid : in STD_LOGIC;
    m_axi_gmem3_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem3_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_rlast : in STD_LOGIC;
    m_axi_gmem3_rready : out STD_LOGIC;
    m_axi_gmem3_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_rvalid : in STD_LOGIC;
    m_axi_gmem3_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem3_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_wlast : out STD_LOGIC;
    m_axi_gmem3_wready : in STD_LOGIC;
    m_axi_gmem3_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_wvalid : out STD_LOGIC;
    s_axi_control_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_arready : out STD_LOGIC;
    s_axi_control_arvalid : in STD_LOGIC;
    s_axi_control_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
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
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_gmem0_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem0_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem0_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_AWVALID : out STD_LOGIC;
    m_axi_gmem0_AWREADY : in STD_LOGIC;
    m_axi_gmem0_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem0_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_WLAST : out STD_LOGIC;
    m_axi_gmem0_WVALID : out STD_LOGIC;
    m_axi_gmem0_WREADY : in STD_LOGIC;
    m_axi_gmem0_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_BVALID : in STD_LOGIC;
    m_axi_gmem0_BREADY : out STD_LOGIC;
    m_axi_gmem0_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem0_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem0_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_ARVALID : out STD_LOGIC;
    m_axi_gmem0_ARREADY : in STD_LOGIC;
    m_axi_gmem0_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem0_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_RLAST : in STD_LOGIC;
    m_axi_gmem0_RVALID : in STD_LOGIC;
    m_axi_gmem0_RREADY : out STD_LOGIC;
    m_axi_gmem1_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem1_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem1_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_AWVALID : out STD_LOGIC;
    m_axi_gmem1_AWREADY : in STD_LOGIC;
    m_axi_gmem1_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem1_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_WLAST : out STD_LOGIC;
    m_axi_gmem1_WVALID : out STD_LOGIC;
    m_axi_gmem1_WREADY : in STD_LOGIC;
    m_axi_gmem1_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_BVALID : in STD_LOGIC;
    m_axi_gmem1_BREADY : out STD_LOGIC;
    m_axi_gmem1_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem1_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem1_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_ARVALID : out STD_LOGIC;
    m_axi_gmem1_ARREADY : in STD_LOGIC;
    m_axi_gmem1_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem1_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_RLAST : in STD_LOGIC;
    m_axi_gmem1_RVALID : in STD_LOGIC;
    m_axi_gmem1_RREADY : out STD_LOGIC;
    m_axi_gmem2_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem2_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem2_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_AWVALID : out STD_LOGIC;
    m_axi_gmem2_AWREADY : in STD_LOGIC;
    m_axi_gmem2_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem2_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_WLAST : out STD_LOGIC;
    m_axi_gmem2_WVALID : out STD_LOGIC;
    m_axi_gmem2_WREADY : in STD_LOGIC;
    m_axi_gmem2_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_BVALID : in STD_LOGIC;
    m_axi_gmem2_BREADY : out STD_LOGIC;
    m_axi_gmem2_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem2_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem2_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_ARVALID : out STD_LOGIC;
    m_axi_gmem2_ARREADY : in STD_LOGIC;
    m_axi_gmem2_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem2_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_RLAST : in STD_LOGIC;
    m_axi_gmem2_RVALID : in STD_LOGIC;
    m_axi_gmem2_RREADY : out STD_LOGIC;
    m_axi_gmem3_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem3_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem3_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_AWVALID : out STD_LOGIC;
    m_axi_gmem3_AWREADY : in STD_LOGIC;
    m_axi_gmem3_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem3_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_WLAST : out STD_LOGIC;
    m_axi_gmem3_WVALID : out STD_LOGIC;
    m_axi_gmem3_WREADY : in STD_LOGIC;
    m_axi_gmem3_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_BVALID : in STD_LOGIC;
    m_axi_gmem3_BREADY : out STD_LOGIC;
    m_axi_gmem3_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem3_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem3_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_ARVALID : out STD_LOGIC;
    m_axi_gmem3_ARREADY : in STD_LOGIC;
    m_axi_gmem3_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem3_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_RLAST : in STD_LOGIC;
    m_axi_gmem3_RVALID : in STD_LOGIC;
    m_axi_gmem3_RREADY : out STD_LOGIC
  );
  end component bd_0_hls_inst_0;
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal hls_inst_interrupt : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_ARADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem0_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem0_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem0_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem0_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem0_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem0_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem0_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem0_ARREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem0_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem0_ARVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_AWADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem0_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem0_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem0_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem0_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem0_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem0_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem0_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem0_AWREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem0_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem0_AWVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem0_BREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem0_BVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem0_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem0_RLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_RREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem0_RVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem0_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem0_WLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_WREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem0_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem0_WVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_ARADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem1_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem1_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem1_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem1_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem1_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem1_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem1_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem1_ARREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem1_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem1_ARVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_AWADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem1_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem1_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem1_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem1_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem1_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem1_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem1_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem1_AWREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem1_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem1_AWVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem1_BREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem1_BVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem1_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem1_RLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_RREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem1_RVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem1_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem1_WLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_WREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem1_WVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_ARADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem2_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem2_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem2_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem2_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem2_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem2_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem2_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem2_ARREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem2_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem2_ARVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_AWADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem2_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem2_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem2_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem2_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem2_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem2_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem2_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem2_AWREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem2_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem2_AWVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem2_BREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem2_BVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem2_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem2_RLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_RREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem2_RVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem2_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem2_WLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_WREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem2_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem2_WVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_ARADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem3_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem3_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem3_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem3_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem3_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem3_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem3_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem3_ARREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem3_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem3_ARVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_AWADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem3_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem3_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem3_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem3_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem3_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem3_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem3_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem3_AWREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem3_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem3_AWVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem3_BREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem3_BVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem3_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem3_RLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_RREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem3_RVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem3_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem3_WLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_WREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem3_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem3_WVALID : STD_LOGIC;
  signal s_axi_control_0_1_ARADDR : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal s_axi_control_0_1_ARREADY : STD_LOGIC;
  signal s_axi_control_0_1_ARVALID : STD_LOGIC;
  signal s_axi_control_0_1_AWADDR : STD_LOGIC_VECTOR ( 6 downto 0 );
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
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF m_axi_gmem0:m_axi_gmem1:m_axi_gmem2:m_axi_gmem3:s_axi_control, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
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
  attribute X_INTERFACE_INFO of m_axi_gmem0_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_PARAMETER of m_axi_gmem0_araddr : signal is "XIL_INTERFACENAME m_axi_gmem0, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_bid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_wid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem0_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_PARAMETER of m_axi_gmem1_araddr : signal is "XIL_INTERFACENAME m_axi_gmem1, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_bid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_wid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem1_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_PARAMETER of m_axi_gmem2_araddr : signal is "XIL_INTERFACENAME m_axi_gmem2, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_bid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_wid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem2_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_PARAMETER of m_axi_gmem3_araddr : signal is "XIL_INTERFACENAME m_axi_gmem3, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_bid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_wid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
  attribute X_INTERFACE_INFO of m_axi_gmem3_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ";
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
  hls_inst_m_axi_gmem0_ARREADY <= m_axi_gmem0_arready;
  hls_inst_m_axi_gmem0_AWREADY <= m_axi_gmem0_awready;
  hls_inst_m_axi_gmem0_BID(0) <= m_axi_gmem0_bid(0);
  hls_inst_m_axi_gmem0_BRESP(1 downto 0) <= m_axi_gmem0_bresp(1 downto 0);
  hls_inst_m_axi_gmem0_BVALID <= m_axi_gmem0_bvalid;
  hls_inst_m_axi_gmem0_RDATA(31 downto 0) <= m_axi_gmem0_rdata(31 downto 0);
  hls_inst_m_axi_gmem0_RID(0) <= m_axi_gmem0_rid(0);
  hls_inst_m_axi_gmem0_RLAST <= m_axi_gmem0_rlast;
  hls_inst_m_axi_gmem0_RRESP(1 downto 0) <= m_axi_gmem0_rresp(1 downto 0);
  hls_inst_m_axi_gmem0_RVALID <= m_axi_gmem0_rvalid;
  hls_inst_m_axi_gmem0_WREADY <= m_axi_gmem0_wready;
  hls_inst_m_axi_gmem1_ARREADY <= m_axi_gmem1_arready;
  hls_inst_m_axi_gmem1_AWREADY <= m_axi_gmem1_awready;
  hls_inst_m_axi_gmem1_BID(0) <= m_axi_gmem1_bid(0);
  hls_inst_m_axi_gmem1_BRESP(1 downto 0) <= m_axi_gmem1_bresp(1 downto 0);
  hls_inst_m_axi_gmem1_BVALID <= m_axi_gmem1_bvalid;
  hls_inst_m_axi_gmem1_RDATA(31 downto 0) <= m_axi_gmem1_rdata(31 downto 0);
  hls_inst_m_axi_gmem1_RID(0) <= m_axi_gmem1_rid(0);
  hls_inst_m_axi_gmem1_RLAST <= m_axi_gmem1_rlast;
  hls_inst_m_axi_gmem1_RRESP(1 downto 0) <= m_axi_gmem1_rresp(1 downto 0);
  hls_inst_m_axi_gmem1_RVALID <= m_axi_gmem1_rvalid;
  hls_inst_m_axi_gmem1_WREADY <= m_axi_gmem1_wready;
  hls_inst_m_axi_gmem2_ARREADY <= m_axi_gmem2_arready;
  hls_inst_m_axi_gmem2_AWREADY <= m_axi_gmem2_awready;
  hls_inst_m_axi_gmem2_BID(0) <= m_axi_gmem2_bid(0);
  hls_inst_m_axi_gmem2_BRESP(1 downto 0) <= m_axi_gmem2_bresp(1 downto 0);
  hls_inst_m_axi_gmem2_BVALID <= m_axi_gmem2_bvalid;
  hls_inst_m_axi_gmem2_RDATA(31 downto 0) <= m_axi_gmem2_rdata(31 downto 0);
  hls_inst_m_axi_gmem2_RID(0) <= m_axi_gmem2_rid(0);
  hls_inst_m_axi_gmem2_RLAST <= m_axi_gmem2_rlast;
  hls_inst_m_axi_gmem2_RRESP(1 downto 0) <= m_axi_gmem2_rresp(1 downto 0);
  hls_inst_m_axi_gmem2_RVALID <= m_axi_gmem2_rvalid;
  hls_inst_m_axi_gmem2_WREADY <= m_axi_gmem2_wready;
  hls_inst_m_axi_gmem3_ARREADY <= m_axi_gmem3_arready;
  hls_inst_m_axi_gmem3_AWREADY <= m_axi_gmem3_awready;
  hls_inst_m_axi_gmem3_BID(0) <= m_axi_gmem3_bid(0);
  hls_inst_m_axi_gmem3_BRESP(1 downto 0) <= m_axi_gmem3_bresp(1 downto 0);
  hls_inst_m_axi_gmem3_BVALID <= m_axi_gmem3_bvalid;
  hls_inst_m_axi_gmem3_RDATA(31 downto 0) <= m_axi_gmem3_rdata(31 downto 0);
  hls_inst_m_axi_gmem3_RID(0) <= m_axi_gmem3_rid(0);
  hls_inst_m_axi_gmem3_RLAST <= m_axi_gmem3_rlast;
  hls_inst_m_axi_gmem3_RRESP(1 downto 0) <= m_axi_gmem3_rresp(1 downto 0);
  hls_inst_m_axi_gmem3_RVALID <= m_axi_gmem3_rvalid;
  hls_inst_m_axi_gmem3_WREADY <= m_axi_gmem3_wready;
  interrupt <= hls_inst_interrupt;
  m_axi_gmem0_araddr(63 downto 0) <= hls_inst_m_axi_gmem0_ARADDR(63 downto 0);
  m_axi_gmem0_arburst(1 downto 0) <= hls_inst_m_axi_gmem0_ARBURST(1 downto 0);
  m_axi_gmem0_arcache(3 downto 0) <= hls_inst_m_axi_gmem0_ARCACHE(3 downto 0);
  m_axi_gmem0_arid(0) <= hls_inst_m_axi_gmem0_ARID(0);
  m_axi_gmem0_arlen(7 downto 0) <= hls_inst_m_axi_gmem0_ARLEN(7 downto 0);
  m_axi_gmem0_arlock(1 downto 0) <= hls_inst_m_axi_gmem0_ARLOCK(1 downto 0);
  m_axi_gmem0_arprot(2 downto 0) <= hls_inst_m_axi_gmem0_ARPROT(2 downto 0);
  m_axi_gmem0_arqos(3 downto 0) <= hls_inst_m_axi_gmem0_ARQOS(3 downto 0);
  m_axi_gmem0_arregion(3 downto 0) <= hls_inst_m_axi_gmem0_ARREGION(3 downto 0);
  m_axi_gmem0_arsize(2 downto 0) <= hls_inst_m_axi_gmem0_ARSIZE(2 downto 0);
  m_axi_gmem0_arvalid <= hls_inst_m_axi_gmem0_ARVALID;
  m_axi_gmem0_awaddr(63 downto 0) <= hls_inst_m_axi_gmem0_AWADDR(63 downto 0);
  m_axi_gmem0_awburst(1 downto 0) <= hls_inst_m_axi_gmem0_AWBURST(1 downto 0);
  m_axi_gmem0_awcache(3 downto 0) <= hls_inst_m_axi_gmem0_AWCACHE(3 downto 0);
  m_axi_gmem0_awid(0) <= hls_inst_m_axi_gmem0_AWID(0);
  m_axi_gmem0_awlen(7 downto 0) <= hls_inst_m_axi_gmem0_AWLEN(7 downto 0);
  m_axi_gmem0_awlock(1 downto 0) <= hls_inst_m_axi_gmem0_AWLOCK(1 downto 0);
  m_axi_gmem0_awprot(2 downto 0) <= hls_inst_m_axi_gmem0_AWPROT(2 downto 0);
  m_axi_gmem0_awqos(3 downto 0) <= hls_inst_m_axi_gmem0_AWQOS(3 downto 0);
  m_axi_gmem0_awregion(3 downto 0) <= hls_inst_m_axi_gmem0_AWREGION(3 downto 0);
  m_axi_gmem0_awsize(2 downto 0) <= hls_inst_m_axi_gmem0_AWSIZE(2 downto 0);
  m_axi_gmem0_awvalid <= hls_inst_m_axi_gmem0_AWVALID;
  m_axi_gmem0_bready <= hls_inst_m_axi_gmem0_BREADY;
  m_axi_gmem0_rready <= hls_inst_m_axi_gmem0_RREADY;
  m_axi_gmem0_wdata(31 downto 0) <= hls_inst_m_axi_gmem0_WDATA(31 downto 0);
  m_axi_gmem0_wid(0) <= hls_inst_m_axi_gmem0_WID(0);
  m_axi_gmem0_wlast <= hls_inst_m_axi_gmem0_WLAST;
  m_axi_gmem0_wstrb(3 downto 0) <= hls_inst_m_axi_gmem0_WSTRB(3 downto 0);
  m_axi_gmem0_wvalid <= hls_inst_m_axi_gmem0_WVALID;
  m_axi_gmem1_araddr(63 downto 0) <= hls_inst_m_axi_gmem1_ARADDR(63 downto 0);
  m_axi_gmem1_arburst(1 downto 0) <= hls_inst_m_axi_gmem1_ARBURST(1 downto 0);
  m_axi_gmem1_arcache(3 downto 0) <= hls_inst_m_axi_gmem1_ARCACHE(3 downto 0);
  m_axi_gmem1_arid(0) <= hls_inst_m_axi_gmem1_ARID(0);
  m_axi_gmem1_arlen(7 downto 0) <= hls_inst_m_axi_gmem1_ARLEN(7 downto 0);
  m_axi_gmem1_arlock(1 downto 0) <= hls_inst_m_axi_gmem1_ARLOCK(1 downto 0);
  m_axi_gmem1_arprot(2 downto 0) <= hls_inst_m_axi_gmem1_ARPROT(2 downto 0);
  m_axi_gmem1_arqos(3 downto 0) <= hls_inst_m_axi_gmem1_ARQOS(3 downto 0);
  m_axi_gmem1_arregion(3 downto 0) <= hls_inst_m_axi_gmem1_ARREGION(3 downto 0);
  m_axi_gmem1_arsize(2 downto 0) <= hls_inst_m_axi_gmem1_ARSIZE(2 downto 0);
  m_axi_gmem1_arvalid <= hls_inst_m_axi_gmem1_ARVALID;
  m_axi_gmem1_awaddr(63 downto 0) <= hls_inst_m_axi_gmem1_AWADDR(63 downto 0);
  m_axi_gmem1_awburst(1 downto 0) <= hls_inst_m_axi_gmem1_AWBURST(1 downto 0);
  m_axi_gmem1_awcache(3 downto 0) <= hls_inst_m_axi_gmem1_AWCACHE(3 downto 0);
  m_axi_gmem1_awid(0) <= hls_inst_m_axi_gmem1_AWID(0);
  m_axi_gmem1_awlen(7 downto 0) <= hls_inst_m_axi_gmem1_AWLEN(7 downto 0);
  m_axi_gmem1_awlock(1 downto 0) <= hls_inst_m_axi_gmem1_AWLOCK(1 downto 0);
  m_axi_gmem1_awprot(2 downto 0) <= hls_inst_m_axi_gmem1_AWPROT(2 downto 0);
  m_axi_gmem1_awqos(3 downto 0) <= hls_inst_m_axi_gmem1_AWQOS(3 downto 0);
  m_axi_gmem1_awregion(3 downto 0) <= hls_inst_m_axi_gmem1_AWREGION(3 downto 0);
  m_axi_gmem1_awsize(2 downto 0) <= hls_inst_m_axi_gmem1_AWSIZE(2 downto 0);
  m_axi_gmem1_awvalid <= hls_inst_m_axi_gmem1_AWVALID;
  m_axi_gmem1_bready <= hls_inst_m_axi_gmem1_BREADY;
  m_axi_gmem1_rready <= hls_inst_m_axi_gmem1_RREADY;
  m_axi_gmem1_wdata(31 downto 0) <= hls_inst_m_axi_gmem1_WDATA(31 downto 0);
  m_axi_gmem1_wid(0) <= hls_inst_m_axi_gmem1_WID(0);
  m_axi_gmem1_wlast <= hls_inst_m_axi_gmem1_WLAST;
  m_axi_gmem1_wstrb(3 downto 0) <= hls_inst_m_axi_gmem1_WSTRB(3 downto 0);
  m_axi_gmem1_wvalid <= hls_inst_m_axi_gmem1_WVALID;
  m_axi_gmem2_araddr(63 downto 0) <= hls_inst_m_axi_gmem2_ARADDR(63 downto 0);
  m_axi_gmem2_arburst(1 downto 0) <= hls_inst_m_axi_gmem2_ARBURST(1 downto 0);
  m_axi_gmem2_arcache(3 downto 0) <= hls_inst_m_axi_gmem2_ARCACHE(3 downto 0);
  m_axi_gmem2_arid(0) <= hls_inst_m_axi_gmem2_ARID(0);
  m_axi_gmem2_arlen(7 downto 0) <= hls_inst_m_axi_gmem2_ARLEN(7 downto 0);
  m_axi_gmem2_arlock(1 downto 0) <= hls_inst_m_axi_gmem2_ARLOCK(1 downto 0);
  m_axi_gmem2_arprot(2 downto 0) <= hls_inst_m_axi_gmem2_ARPROT(2 downto 0);
  m_axi_gmem2_arqos(3 downto 0) <= hls_inst_m_axi_gmem2_ARQOS(3 downto 0);
  m_axi_gmem2_arregion(3 downto 0) <= hls_inst_m_axi_gmem2_ARREGION(3 downto 0);
  m_axi_gmem2_arsize(2 downto 0) <= hls_inst_m_axi_gmem2_ARSIZE(2 downto 0);
  m_axi_gmem2_arvalid <= hls_inst_m_axi_gmem2_ARVALID;
  m_axi_gmem2_awaddr(63 downto 0) <= hls_inst_m_axi_gmem2_AWADDR(63 downto 0);
  m_axi_gmem2_awburst(1 downto 0) <= hls_inst_m_axi_gmem2_AWBURST(1 downto 0);
  m_axi_gmem2_awcache(3 downto 0) <= hls_inst_m_axi_gmem2_AWCACHE(3 downto 0);
  m_axi_gmem2_awid(0) <= hls_inst_m_axi_gmem2_AWID(0);
  m_axi_gmem2_awlen(7 downto 0) <= hls_inst_m_axi_gmem2_AWLEN(7 downto 0);
  m_axi_gmem2_awlock(1 downto 0) <= hls_inst_m_axi_gmem2_AWLOCK(1 downto 0);
  m_axi_gmem2_awprot(2 downto 0) <= hls_inst_m_axi_gmem2_AWPROT(2 downto 0);
  m_axi_gmem2_awqos(3 downto 0) <= hls_inst_m_axi_gmem2_AWQOS(3 downto 0);
  m_axi_gmem2_awregion(3 downto 0) <= hls_inst_m_axi_gmem2_AWREGION(3 downto 0);
  m_axi_gmem2_awsize(2 downto 0) <= hls_inst_m_axi_gmem2_AWSIZE(2 downto 0);
  m_axi_gmem2_awvalid <= hls_inst_m_axi_gmem2_AWVALID;
  m_axi_gmem2_bready <= hls_inst_m_axi_gmem2_BREADY;
  m_axi_gmem2_rready <= hls_inst_m_axi_gmem2_RREADY;
  m_axi_gmem2_wdata(31 downto 0) <= hls_inst_m_axi_gmem2_WDATA(31 downto 0);
  m_axi_gmem2_wid(0) <= hls_inst_m_axi_gmem2_WID(0);
  m_axi_gmem2_wlast <= hls_inst_m_axi_gmem2_WLAST;
  m_axi_gmem2_wstrb(3 downto 0) <= hls_inst_m_axi_gmem2_WSTRB(3 downto 0);
  m_axi_gmem2_wvalid <= hls_inst_m_axi_gmem2_WVALID;
  m_axi_gmem3_araddr(63 downto 0) <= hls_inst_m_axi_gmem3_ARADDR(63 downto 0);
  m_axi_gmem3_arburst(1 downto 0) <= hls_inst_m_axi_gmem3_ARBURST(1 downto 0);
  m_axi_gmem3_arcache(3 downto 0) <= hls_inst_m_axi_gmem3_ARCACHE(3 downto 0);
  m_axi_gmem3_arid(0) <= hls_inst_m_axi_gmem3_ARID(0);
  m_axi_gmem3_arlen(7 downto 0) <= hls_inst_m_axi_gmem3_ARLEN(7 downto 0);
  m_axi_gmem3_arlock(1 downto 0) <= hls_inst_m_axi_gmem3_ARLOCK(1 downto 0);
  m_axi_gmem3_arprot(2 downto 0) <= hls_inst_m_axi_gmem3_ARPROT(2 downto 0);
  m_axi_gmem3_arqos(3 downto 0) <= hls_inst_m_axi_gmem3_ARQOS(3 downto 0);
  m_axi_gmem3_arregion(3 downto 0) <= hls_inst_m_axi_gmem3_ARREGION(3 downto 0);
  m_axi_gmem3_arsize(2 downto 0) <= hls_inst_m_axi_gmem3_ARSIZE(2 downto 0);
  m_axi_gmem3_arvalid <= hls_inst_m_axi_gmem3_ARVALID;
  m_axi_gmem3_awaddr(63 downto 0) <= hls_inst_m_axi_gmem3_AWADDR(63 downto 0);
  m_axi_gmem3_awburst(1 downto 0) <= hls_inst_m_axi_gmem3_AWBURST(1 downto 0);
  m_axi_gmem3_awcache(3 downto 0) <= hls_inst_m_axi_gmem3_AWCACHE(3 downto 0);
  m_axi_gmem3_awid(0) <= hls_inst_m_axi_gmem3_AWID(0);
  m_axi_gmem3_awlen(7 downto 0) <= hls_inst_m_axi_gmem3_AWLEN(7 downto 0);
  m_axi_gmem3_awlock(1 downto 0) <= hls_inst_m_axi_gmem3_AWLOCK(1 downto 0);
  m_axi_gmem3_awprot(2 downto 0) <= hls_inst_m_axi_gmem3_AWPROT(2 downto 0);
  m_axi_gmem3_awqos(3 downto 0) <= hls_inst_m_axi_gmem3_AWQOS(3 downto 0);
  m_axi_gmem3_awregion(3 downto 0) <= hls_inst_m_axi_gmem3_AWREGION(3 downto 0);
  m_axi_gmem3_awsize(2 downto 0) <= hls_inst_m_axi_gmem3_AWSIZE(2 downto 0);
  m_axi_gmem3_awvalid <= hls_inst_m_axi_gmem3_AWVALID;
  m_axi_gmem3_bready <= hls_inst_m_axi_gmem3_BREADY;
  m_axi_gmem3_rready <= hls_inst_m_axi_gmem3_RREADY;
  m_axi_gmem3_wdata(31 downto 0) <= hls_inst_m_axi_gmem3_WDATA(31 downto 0);
  m_axi_gmem3_wid(0) <= hls_inst_m_axi_gmem3_WID(0);
  m_axi_gmem3_wlast <= hls_inst_m_axi_gmem3_WLAST;
  m_axi_gmem3_wstrb(3 downto 0) <= hls_inst_m_axi_gmem3_WSTRB(3 downto 0);
  m_axi_gmem3_wvalid <= hls_inst_m_axi_gmem3_WVALID;
  s_axi_control_0_1_ARADDR(6 downto 0) <= s_axi_control_araddr(6 downto 0);
  s_axi_control_0_1_ARVALID <= s_axi_control_arvalid;
  s_axi_control_0_1_AWADDR(6 downto 0) <= s_axi_control_awaddr(6 downto 0);
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
      m_axi_gmem0_ARADDR(63 downto 0) => hls_inst_m_axi_gmem0_ARADDR(63 downto 0),
      m_axi_gmem0_ARBURST(1 downto 0) => hls_inst_m_axi_gmem0_ARBURST(1 downto 0),
      m_axi_gmem0_ARCACHE(3 downto 0) => hls_inst_m_axi_gmem0_ARCACHE(3 downto 0),
      m_axi_gmem0_ARID(0) => hls_inst_m_axi_gmem0_ARID(0),
      m_axi_gmem0_ARLEN(7 downto 0) => hls_inst_m_axi_gmem0_ARLEN(7 downto 0),
      m_axi_gmem0_ARLOCK(1 downto 0) => hls_inst_m_axi_gmem0_ARLOCK(1 downto 0),
      m_axi_gmem0_ARPROT(2 downto 0) => hls_inst_m_axi_gmem0_ARPROT(2 downto 0),
      m_axi_gmem0_ARQOS(3 downto 0) => hls_inst_m_axi_gmem0_ARQOS(3 downto 0),
      m_axi_gmem0_ARREADY => hls_inst_m_axi_gmem0_ARREADY,
      m_axi_gmem0_ARREGION(3 downto 0) => hls_inst_m_axi_gmem0_ARREGION(3 downto 0),
      m_axi_gmem0_ARSIZE(2 downto 0) => hls_inst_m_axi_gmem0_ARSIZE(2 downto 0),
      m_axi_gmem0_ARVALID => hls_inst_m_axi_gmem0_ARVALID,
      m_axi_gmem0_AWADDR(63 downto 0) => hls_inst_m_axi_gmem0_AWADDR(63 downto 0),
      m_axi_gmem0_AWBURST(1 downto 0) => hls_inst_m_axi_gmem0_AWBURST(1 downto 0),
      m_axi_gmem0_AWCACHE(3 downto 0) => hls_inst_m_axi_gmem0_AWCACHE(3 downto 0),
      m_axi_gmem0_AWID(0) => hls_inst_m_axi_gmem0_AWID(0),
      m_axi_gmem0_AWLEN(7 downto 0) => hls_inst_m_axi_gmem0_AWLEN(7 downto 0),
      m_axi_gmem0_AWLOCK(1 downto 0) => hls_inst_m_axi_gmem0_AWLOCK(1 downto 0),
      m_axi_gmem0_AWPROT(2 downto 0) => hls_inst_m_axi_gmem0_AWPROT(2 downto 0),
      m_axi_gmem0_AWQOS(3 downto 0) => hls_inst_m_axi_gmem0_AWQOS(3 downto 0),
      m_axi_gmem0_AWREADY => hls_inst_m_axi_gmem0_AWREADY,
      m_axi_gmem0_AWREGION(3 downto 0) => hls_inst_m_axi_gmem0_AWREGION(3 downto 0),
      m_axi_gmem0_AWSIZE(2 downto 0) => hls_inst_m_axi_gmem0_AWSIZE(2 downto 0),
      m_axi_gmem0_AWVALID => hls_inst_m_axi_gmem0_AWVALID,
      m_axi_gmem0_BID(0) => hls_inst_m_axi_gmem0_BID(0),
      m_axi_gmem0_BREADY => hls_inst_m_axi_gmem0_BREADY,
      m_axi_gmem0_BRESP(1 downto 0) => hls_inst_m_axi_gmem0_BRESP(1 downto 0),
      m_axi_gmem0_BVALID => hls_inst_m_axi_gmem0_BVALID,
      m_axi_gmem0_RDATA(31 downto 0) => hls_inst_m_axi_gmem0_RDATA(31 downto 0),
      m_axi_gmem0_RID(0) => hls_inst_m_axi_gmem0_RID(0),
      m_axi_gmem0_RLAST => hls_inst_m_axi_gmem0_RLAST,
      m_axi_gmem0_RREADY => hls_inst_m_axi_gmem0_RREADY,
      m_axi_gmem0_RRESP(1 downto 0) => hls_inst_m_axi_gmem0_RRESP(1 downto 0),
      m_axi_gmem0_RVALID => hls_inst_m_axi_gmem0_RVALID,
      m_axi_gmem0_WDATA(31 downto 0) => hls_inst_m_axi_gmem0_WDATA(31 downto 0),
      m_axi_gmem0_WID(0) => hls_inst_m_axi_gmem0_WID(0),
      m_axi_gmem0_WLAST => hls_inst_m_axi_gmem0_WLAST,
      m_axi_gmem0_WREADY => hls_inst_m_axi_gmem0_WREADY,
      m_axi_gmem0_WSTRB(3 downto 0) => hls_inst_m_axi_gmem0_WSTRB(3 downto 0),
      m_axi_gmem0_WVALID => hls_inst_m_axi_gmem0_WVALID,
      m_axi_gmem1_ARADDR(63 downto 0) => hls_inst_m_axi_gmem1_ARADDR(63 downto 0),
      m_axi_gmem1_ARBURST(1 downto 0) => hls_inst_m_axi_gmem1_ARBURST(1 downto 0),
      m_axi_gmem1_ARCACHE(3 downto 0) => hls_inst_m_axi_gmem1_ARCACHE(3 downto 0),
      m_axi_gmem1_ARID(0) => hls_inst_m_axi_gmem1_ARID(0),
      m_axi_gmem1_ARLEN(7 downto 0) => hls_inst_m_axi_gmem1_ARLEN(7 downto 0),
      m_axi_gmem1_ARLOCK(1 downto 0) => hls_inst_m_axi_gmem1_ARLOCK(1 downto 0),
      m_axi_gmem1_ARPROT(2 downto 0) => hls_inst_m_axi_gmem1_ARPROT(2 downto 0),
      m_axi_gmem1_ARQOS(3 downto 0) => hls_inst_m_axi_gmem1_ARQOS(3 downto 0),
      m_axi_gmem1_ARREADY => hls_inst_m_axi_gmem1_ARREADY,
      m_axi_gmem1_ARREGION(3 downto 0) => hls_inst_m_axi_gmem1_ARREGION(3 downto 0),
      m_axi_gmem1_ARSIZE(2 downto 0) => hls_inst_m_axi_gmem1_ARSIZE(2 downto 0),
      m_axi_gmem1_ARVALID => hls_inst_m_axi_gmem1_ARVALID,
      m_axi_gmem1_AWADDR(63 downto 0) => hls_inst_m_axi_gmem1_AWADDR(63 downto 0),
      m_axi_gmem1_AWBURST(1 downto 0) => hls_inst_m_axi_gmem1_AWBURST(1 downto 0),
      m_axi_gmem1_AWCACHE(3 downto 0) => hls_inst_m_axi_gmem1_AWCACHE(3 downto 0),
      m_axi_gmem1_AWID(0) => hls_inst_m_axi_gmem1_AWID(0),
      m_axi_gmem1_AWLEN(7 downto 0) => hls_inst_m_axi_gmem1_AWLEN(7 downto 0),
      m_axi_gmem1_AWLOCK(1 downto 0) => hls_inst_m_axi_gmem1_AWLOCK(1 downto 0),
      m_axi_gmem1_AWPROT(2 downto 0) => hls_inst_m_axi_gmem1_AWPROT(2 downto 0),
      m_axi_gmem1_AWQOS(3 downto 0) => hls_inst_m_axi_gmem1_AWQOS(3 downto 0),
      m_axi_gmem1_AWREADY => hls_inst_m_axi_gmem1_AWREADY,
      m_axi_gmem1_AWREGION(3 downto 0) => hls_inst_m_axi_gmem1_AWREGION(3 downto 0),
      m_axi_gmem1_AWSIZE(2 downto 0) => hls_inst_m_axi_gmem1_AWSIZE(2 downto 0),
      m_axi_gmem1_AWVALID => hls_inst_m_axi_gmem1_AWVALID,
      m_axi_gmem1_BID(0) => hls_inst_m_axi_gmem1_BID(0),
      m_axi_gmem1_BREADY => hls_inst_m_axi_gmem1_BREADY,
      m_axi_gmem1_BRESP(1 downto 0) => hls_inst_m_axi_gmem1_BRESP(1 downto 0),
      m_axi_gmem1_BVALID => hls_inst_m_axi_gmem1_BVALID,
      m_axi_gmem1_RDATA(31 downto 0) => hls_inst_m_axi_gmem1_RDATA(31 downto 0),
      m_axi_gmem1_RID(0) => hls_inst_m_axi_gmem1_RID(0),
      m_axi_gmem1_RLAST => hls_inst_m_axi_gmem1_RLAST,
      m_axi_gmem1_RREADY => hls_inst_m_axi_gmem1_RREADY,
      m_axi_gmem1_RRESP(1 downto 0) => hls_inst_m_axi_gmem1_RRESP(1 downto 0),
      m_axi_gmem1_RVALID => hls_inst_m_axi_gmem1_RVALID,
      m_axi_gmem1_WDATA(31 downto 0) => hls_inst_m_axi_gmem1_WDATA(31 downto 0),
      m_axi_gmem1_WID(0) => hls_inst_m_axi_gmem1_WID(0),
      m_axi_gmem1_WLAST => hls_inst_m_axi_gmem1_WLAST,
      m_axi_gmem1_WREADY => hls_inst_m_axi_gmem1_WREADY,
      m_axi_gmem1_WSTRB(3 downto 0) => hls_inst_m_axi_gmem1_WSTRB(3 downto 0),
      m_axi_gmem1_WVALID => hls_inst_m_axi_gmem1_WVALID,
      m_axi_gmem2_ARADDR(63 downto 0) => hls_inst_m_axi_gmem2_ARADDR(63 downto 0),
      m_axi_gmem2_ARBURST(1 downto 0) => hls_inst_m_axi_gmem2_ARBURST(1 downto 0),
      m_axi_gmem2_ARCACHE(3 downto 0) => hls_inst_m_axi_gmem2_ARCACHE(3 downto 0),
      m_axi_gmem2_ARID(0) => hls_inst_m_axi_gmem2_ARID(0),
      m_axi_gmem2_ARLEN(7 downto 0) => hls_inst_m_axi_gmem2_ARLEN(7 downto 0),
      m_axi_gmem2_ARLOCK(1 downto 0) => hls_inst_m_axi_gmem2_ARLOCK(1 downto 0),
      m_axi_gmem2_ARPROT(2 downto 0) => hls_inst_m_axi_gmem2_ARPROT(2 downto 0),
      m_axi_gmem2_ARQOS(3 downto 0) => hls_inst_m_axi_gmem2_ARQOS(3 downto 0),
      m_axi_gmem2_ARREADY => hls_inst_m_axi_gmem2_ARREADY,
      m_axi_gmem2_ARREGION(3 downto 0) => hls_inst_m_axi_gmem2_ARREGION(3 downto 0),
      m_axi_gmem2_ARSIZE(2 downto 0) => hls_inst_m_axi_gmem2_ARSIZE(2 downto 0),
      m_axi_gmem2_ARVALID => hls_inst_m_axi_gmem2_ARVALID,
      m_axi_gmem2_AWADDR(63 downto 0) => hls_inst_m_axi_gmem2_AWADDR(63 downto 0),
      m_axi_gmem2_AWBURST(1 downto 0) => hls_inst_m_axi_gmem2_AWBURST(1 downto 0),
      m_axi_gmem2_AWCACHE(3 downto 0) => hls_inst_m_axi_gmem2_AWCACHE(3 downto 0),
      m_axi_gmem2_AWID(0) => hls_inst_m_axi_gmem2_AWID(0),
      m_axi_gmem2_AWLEN(7 downto 0) => hls_inst_m_axi_gmem2_AWLEN(7 downto 0),
      m_axi_gmem2_AWLOCK(1 downto 0) => hls_inst_m_axi_gmem2_AWLOCK(1 downto 0),
      m_axi_gmem2_AWPROT(2 downto 0) => hls_inst_m_axi_gmem2_AWPROT(2 downto 0),
      m_axi_gmem2_AWQOS(3 downto 0) => hls_inst_m_axi_gmem2_AWQOS(3 downto 0),
      m_axi_gmem2_AWREADY => hls_inst_m_axi_gmem2_AWREADY,
      m_axi_gmem2_AWREGION(3 downto 0) => hls_inst_m_axi_gmem2_AWREGION(3 downto 0),
      m_axi_gmem2_AWSIZE(2 downto 0) => hls_inst_m_axi_gmem2_AWSIZE(2 downto 0),
      m_axi_gmem2_AWVALID => hls_inst_m_axi_gmem2_AWVALID,
      m_axi_gmem2_BID(0) => hls_inst_m_axi_gmem2_BID(0),
      m_axi_gmem2_BREADY => hls_inst_m_axi_gmem2_BREADY,
      m_axi_gmem2_BRESP(1 downto 0) => hls_inst_m_axi_gmem2_BRESP(1 downto 0),
      m_axi_gmem2_BVALID => hls_inst_m_axi_gmem2_BVALID,
      m_axi_gmem2_RDATA(31 downto 0) => hls_inst_m_axi_gmem2_RDATA(31 downto 0),
      m_axi_gmem2_RID(0) => hls_inst_m_axi_gmem2_RID(0),
      m_axi_gmem2_RLAST => hls_inst_m_axi_gmem2_RLAST,
      m_axi_gmem2_RREADY => hls_inst_m_axi_gmem2_RREADY,
      m_axi_gmem2_RRESP(1 downto 0) => hls_inst_m_axi_gmem2_RRESP(1 downto 0),
      m_axi_gmem2_RVALID => hls_inst_m_axi_gmem2_RVALID,
      m_axi_gmem2_WDATA(31 downto 0) => hls_inst_m_axi_gmem2_WDATA(31 downto 0),
      m_axi_gmem2_WID(0) => hls_inst_m_axi_gmem2_WID(0),
      m_axi_gmem2_WLAST => hls_inst_m_axi_gmem2_WLAST,
      m_axi_gmem2_WREADY => hls_inst_m_axi_gmem2_WREADY,
      m_axi_gmem2_WSTRB(3 downto 0) => hls_inst_m_axi_gmem2_WSTRB(3 downto 0),
      m_axi_gmem2_WVALID => hls_inst_m_axi_gmem2_WVALID,
      m_axi_gmem3_ARADDR(63 downto 0) => hls_inst_m_axi_gmem3_ARADDR(63 downto 0),
      m_axi_gmem3_ARBURST(1 downto 0) => hls_inst_m_axi_gmem3_ARBURST(1 downto 0),
      m_axi_gmem3_ARCACHE(3 downto 0) => hls_inst_m_axi_gmem3_ARCACHE(3 downto 0),
      m_axi_gmem3_ARID(0) => hls_inst_m_axi_gmem3_ARID(0),
      m_axi_gmem3_ARLEN(7 downto 0) => hls_inst_m_axi_gmem3_ARLEN(7 downto 0),
      m_axi_gmem3_ARLOCK(1 downto 0) => hls_inst_m_axi_gmem3_ARLOCK(1 downto 0),
      m_axi_gmem3_ARPROT(2 downto 0) => hls_inst_m_axi_gmem3_ARPROT(2 downto 0),
      m_axi_gmem3_ARQOS(3 downto 0) => hls_inst_m_axi_gmem3_ARQOS(3 downto 0),
      m_axi_gmem3_ARREADY => hls_inst_m_axi_gmem3_ARREADY,
      m_axi_gmem3_ARREGION(3 downto 0) => hls_inst_m_axi_gmem3_ARREGION(3 downto 0),
      m_axi_gmem3_ARSIZE(2 downto 0) => hls_inst_m_axi_gmem3_ARSIZE(2 downto 0),
      m_axi_gmem3_ARVALID => hls_inst_m_axi_gmem3_ARVALID,
      m_axi_gmem3_AWADDR(63 downto 0) => hls_inst_m_axi_gmem3_AWADDR(63 downto 0),
      m_axi_gmem3_AWBURST(1 downto 0) => hls_inst_m_axi_gmem3_AWBURST(1 downto 0),
      m_axi_gmem3_AWCACHE(3 downto 0) => hls_inst_m_axi_gmem3_AWCACHE(3 downto 0),
      m_axi_gmem3_AWID(0) => hls_inst_m_axi_gmem3_AWID(0),
      m_axi_gmem3_AWLEN(7 downto 0) => hls_inst_m_axi_gmem3_AWLEN(7 downto 0),
      m_axi_gmem3_AWLOCK(1 downto 0) => hls_inst_m_axi_gmem3_AWLOCK(1 downto 0),
      m_axi_gmem3_AWPROT(2 downto 0) => hls_inst_m_axi_gmem3_AWPROT(2 downto 0),
      m_axi_gmem3_AWQOS(3 downto 0) => hls_inst_m_axi_gmem3_AWQOS(3 downto 0),
      m_axi_gmem3_AWREADY => hls_inst_m_axi_gmem3_AWREADY,
      m_axi_gmem3_AWREGION(3 downto 0) => hls_inst_m_axi_gmem3_AWREGION(3 downto 0),
      m_axi_gmem3_AWSIZE(2 downto 0) => hls_inst_m_axi_gmem3_AWSIZE(2 downto 0),
      m_axi_gmem3_AWVALID => hls_inst_m_axi_gmem3_AWVALID,
      m_axi_gmem3_BID(0) => hls_inst_m_axi_gmem3_BID(0),
      m_axi_gmem3_BREADY => hls_inst_m_axi_gmem3_BREADY,
      m_axi_gmem3_BRESP(1 downto 0) => hls_inst_m_axi_gmem3_BRESP(1 downto 0),
      m_axi_gmem3_BVALID => hls_inst_m_axi_gmem3_BVALID,
      m_axi_gmem3_RDATA(31 downto 0) => hls_inst_m_axi_gmem3_RDATA(31 downto 0),
      m_axi_gmem3_RID(0) => hls_inst_m_axi_gmem3_RID(0),
      m_axi_gmem3_RLAST => hls_inst_m_axi_gmem3_RLAST,
      m_axi_gmem3_RREADY => hls_inst_m_axi_gmem3_RREADY,
      m_axi_gmem3_RRESP(1 downto 0) => hls_inst_m_axi_gmem3_RRESP(1 downto 0),
      m_axi_gmem3_RVALID => hls_inst_m_axi_gmem3_RVALID,
      m_axi_gmem3_WDATA(31 downto 0) => hls_inst_m_axi_gmem3_WDATA(31 downto 0),
      m_axi_gmem3_WID(0) => hls_inst_m_axi_gmem3_WID(0),
      m_axi_gmem3_WLAST => hls_inst_m_axi_gmem3_WLAST,
      m_axi_gmem3_WREADY => hls_inst_m_axi_gmem3_WREADY,
      m_axi_gmem3_WSTRB(3 downto 0) => hls_inst_m_axi_gmem3_WSTRB(3 downto 0),
      m_axi_gmem3_WVALID => hls_inst_m_axi_gmem3_WVALID,
      s_axi_control_ARADDR(6 downto 0) => s_axi_control_0_1_ARADDR(6 downto 0),
      s_axi_control_ARREADY => s_axi_control_0_1_ARREADY,
      s_axi_control_ARVALID => s_axi_control_0_1_ARVALID,
      s_axi_control_AWADDR(6 downto 0) => s_axi_control_0_1_AWADDR(6 downto 0),
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
