--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Sun Jun  9 10:01:42 2024
--Host        : MSI running 64-bit major release  (build 9200)
--Command     : generate_target bd_0_wrapper.bd
--Design      : bd_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_wrapper is
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
end bd_0_wrapper;

architecture STRUCTURE of bd_0_wrapper is
  component bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_gmem0_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_awvalid : out STD_LOGIC;
    m_axi_gmem0_awready : in STD_LOGIC;
    m_axi_gmem0_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_wlast : out STD_LOGIC;
    m_axi_gmem0_wvalid : out STD_LOGIC;
    m_axi_gmem0_wready : in STD_LOGIC;
    m_axi_gmem0_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_bvalid : in STD_LOGIC;
    m_axi_gmem0_bready : out STD_LOGIC;
    m_axi_gmem0_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem0_arvalid : out STD_LOGIC;
    m_axi_gmem0_arready : in STD_LOGIC;
    m_axi_gmem0_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem0_rlast : in STD_LOGIC;
    m_axi_gmem0_rvalid : in STD_LOGIC;
    m_axi_gmem0_rready : out STD_LOGIC;
    m_axi_gmem1_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem1_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem1_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_awvalid : out STD_LOGIC;
    m_axi_gmem1_awready : in STD_LOGIC;
    m_axi_gmem1_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem1_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_wlast : out STD_LOGIC;
    m_axi_gmem1_wvalid : out STD_LOGIC;
    m_axi_gmem1_wready : in STD_LOGIC;
    m_axi_gmem1_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_bvalid : in STD_LOGIC;
    m_axi_gmem1_bready : out STD_LOGIC;
    m_axi_gmem1_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem1_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem1_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem1_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem1_arvalid : out STD_LOGIC;
    m_axi_gmem1_arready : in STD_LOGIC;
    m_axi_gmem1_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem1_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem1_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem1_rlast : in STD_LOGIC;
    m_axi_gmem1_rvalid : in STD_LOGIC;
    m_axi_gmem1_rready : out STD_LOGIC;
    m_axi_gmem2_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem2_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem2_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_awvalid : out STD_LOGIC;
    m_axi_gmem2_awready : in STD_LOGIC;
    m_axi_gmem2_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem2_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_wlast : out STD_LOGIC;
    m_axi_gmem2_wvalid : out STD_LOGIC;
    m_axi_gmem2_wready : in STD_LOGIC;
    m_axi_gmem2_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_bvalid : in STD_LOGIC;
    m_axi_gmem2_bready : out STD_LOGIC;
    m_axi_gmem2_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem2_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem2_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem2_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem2_arvalid : out STD_LOGIC;
    m_axi_gmem2_arready : in STD_LOGIC;
    m_axi_gmem2_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem2_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem2_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem2_rlast : in STD_LOGIC;
    m_axi_gmem2_rvalid : in STD_LOGIC;
    m_axi_gmem2_rready : out STD_LOGIC;
    m_axi_gmem3_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem3_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem3_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_awvalid : out STD_LOGIC;
    m_axi_gmem3_awready : in STD_LOGIC;
    m_axi_gmem3_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem3_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_wlast : out STD_LOGIC;
    m_axi_gmem3_wvalid : out STD_LOGIC;
    m_axi_gmem3_wready : in STD_LOGIC;
    m_axi_gmem3_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_bvalid : in STD_LOGIC;
    m_axi_gmem3_bready : out STD_LOGIC;
    m_axi_gmem3_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem3_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem3_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem3_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem3_arvalid : out STD_LOGIC;
    m_axi_gmem3_arready : in STD_LOGIC;
    m_axi_gmem3_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem3_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem3_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem3_rlast : in STD_LOGIC;
    m_axi_gmem3_rvalid : in STD_LOGIC;
    m_axi_gmem3_rready : out STD_LOGIC;
    s_axi_control_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_awvalid : in STD_LOGIC;
    s_axi_control_awready : out STD_LOGIC;
    s_axi_control_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_wvalid : in STD_LOGIC;
    s_axi_control_wready : out STD_LOGIC;
    s_axi_control_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_bvalid : out STD_LOGIC;
    s_axi_control_bready : in STD_LOGIC;
    s_axi_control_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_control_arvalid : in STD_LOGIC;
    s_axi_control_arready : out STD_LOGIC;
    s_axi_control_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_rvalid : out STD_LOGIC;
    s_axi_control_rready : in STD_LOGIC
  );
  end component bd_0;
begin
bd_0_i: component bd_0
     port map (
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      m_axi_gmem0_araddr(63 downto 0) => m_axi_gmem0_araddr(63 downto 0),
      m_axi_gmem0_arburst(1 downto 0) => m_axi_gmem0_arburst(1 downto 0),
      m_axi_gmem0_arcache(3 downto 0) => m_axi_gmem0_arcache(3 downto 0),
      m_axi_gmem0_arid(0) => m_axi_gmem0_arid(0),
      m_axi_gmem0_arlen(7 downto 0) => m_axi_gmem0_arlen(7 downto 0),
      m_axi_gmem0_arlock(1 downto 0) => m_axi_gmem0_arlock(1 downto 0),
      m_axi_gmem0_arprot(2 downto 0) => m_axi_gmem0_arprot(2 downto 0),
      m_axi_gmem0_arqos(3 downto 0) => m_axi_gmem0_arqos(3 downto 0),
      m_axi_gmem0_arready => m_axi_gmem0_arready,
      m_axi_gmem0_arregion(3 downto 0) => m_axi_gmem0_arregion(3 downto 0),
      m_axi_gmem0_arsize(2 downto 0) => m_axi_gmem0_arsize(2 downto 0),
      m_axi_gmem0_arvalid => m_axi_gmem0_arvalid,
      m_axi_gmem0_awaddr(63 downto 0) => m_axi_gmem0_awaddr(63 downto 0),
      m_axi_gmem0_awburst(1 downto 0) => m_axi_gmem0_awburst(1 downto 0),
      m_axi_gmem0_awcache(3 downto 0) => m_axi_gmem0_awcache(3 downto 0),
      m_axi_gmem0_awid(0) => m_axi_gmem0_awid(0),
      m_axi_gmem0_awlen(7 downto 0) => m_axi_gmem0_awlen(7 downto 0),
      m_axi_gmem0_awlock(1 downto 0) => m_axi_gmem0_awlock(1 downto 0),
      m_axi_gmem0_awprot(2 downto 0) => m_axi_gmem0_awprot(2 downto 0),
      m_axi_gmem0_awqos(3 downto 0) => m_axi_gmem0_awqos(3 downto 0),
      m_axi_gmem0_awready => m_axi_gmem0_awready,
      m_axi_gmem0_awregion(3 downto 0) => m_axi_gmem0_awregion(3 downto 0),
      m_axi_gmem0_awsize(2 downto 0) => m_axi_gmem0_awsize(2 downto 0),
      m_axi_gmem0_awvalid => m_axi_gmem0_awvalid,
      m_axi_gmem0_bid(0) => m_axi_gmem0_bid(0),
      m_axi_gmem0_bready => m_axi_gmem0_bready,
      m_axi_gmem0_bresp(1 downto 0) => m_axi_gmem0_bresp(1 downto 0),
      m_axi_gmem0_bvalid => m_axi_gmem0_bvalid,
      m_axi_gmem0_rdata(31 downto 0) => m_axi_gmem0_rdata(31 downto 0),
      m_axi_gmem0_rid(0) => m_axi_gmem0_rid(0),
      m_axi_gmem0_rlast => m_axi_gmem0_rlast,
      m_axi_gmem0_rready => m_axi_gmem0_rready,
      m_axi_gmem0_rresp(1 downto 0) => m_axi_gmem0_rresp(1 downto 0),
      m_axi_gmem0_rvalid => m_axi_gmem0_rvalid,
      m_axi_gmem0_wdata(31 downto 0) => m_axi_gmem0_wdata(31 downto 0),
      m_axi_gmem0_wid(0) => m_axi_gmem0_wid(0),
      m_axi_gmem0_wlast => m_axi_gmem0_wlast,
      m_axi_gmem0_wready => m_axi_gmem0_wready,
      m_axi_gmem0_wstrb(3 downto 0) => m_axi_gmem0_wstrb(3 downto 0),
      m_axi_gmem0_wvalid => m_axi_gmem0_wvalid,
      m_axi_gmem1_araddr(63 downto 0) => m_axi_gmem1_araddr(63 downto 0),
      m_axi_gmem1_arburst(1 downto 0) => m_axi_gmem1_arburst(1 downto 0),
      m_axi_gmem1_arcache(3 downto 0) => m_axi_gmem1_arcache(3 downto 0),
      m_axi_gmem1_arid(0) => m_axi_gmem1_arid(0),
      m_axi_gmem1_arlen(7 downto 0) => m_axi_gmem1_arlen(7 downto 0),
      m_axi_gmem1_arlock(1 downto 0) => m_axi_gmem1_arlock(1 downto 0),
      m_axi_gmem1_arprot(2 downto 0) => m_axi_gmem1_arprot(2 downto 0),
      m_axi_gmem1_arqos(3 downto 0) => m_axi_gmem1_arqos(3 downto 0),
      m_axi_gmem1_arready => m_axi_gmem1_arready,
      m_axi_gmem1_arregion(3 downto 0) => m_axi_gmem1_arregion(3 downto 0),
      m_axi_gmem1_arsize(2 downto 0) => m_axi_gmem1_arsize(2 downto 0),
      m_axi_gmem1_arvalid => m_axi_gmem1_arvalid,
      m_axi_gmem1_awaddr(63 downto 0) => m_axi_gmem1_awaddr(63 downto 0),
      m_axi_gmem1_awburst(1 downto 0) => m_axi_gmem1_awburst(1 downto 0),
      m_axi_gmem1_awcache(3 downto 0) => m_axi_gmem1_awcache(3 downto 0),
      m_axi_gmem1_awid(0) => m_axi_gmem1_awid(0),
      m_axi_gmem1_awlen(7 downto 0) => m_axi_gmem1_awlen(7 downto 0),
      m_axi_gmem1_awlock(1 downto 0) => m_axi_gmem1_awlock(1 downto 0),
      m_axi_gmem1_awprot(2 downto 0) => m_axi_gmem1_awprot(2 downto 0),
      m_axi_gmem1_awqos(3 downto 0) => m_axi_gmem1_awqos(3 downto 0),
      m_axi_gmem1_awready => m_axi_gmem1_awready,
      m_axi_gmem1_awregion(3 downto 0) => m_axi_gmem1_awregion(3 downto 0),
      m_axi_gmem1_awsize(2 downto 0) => m_axi_gmem1_awsize(2 downto 0),
      m_axi_gmem1_awvalid => m_axi_gmem1_awvalid,
      m_axi_gmem1_bid(0) => m_axi_gmem1_bid(0),
      m_axi_gmem1_bready => m_axi_gmem1_bready,
      m_axi_gmem1_bresp(1 downto 0) => m_axi_gmem1_bresp(1 downto 0),
      m_axi_gmem1_bvalid => m_axi_gmem1_bvalid,
      m_axi_gmem1_rdata(31 downto 0) => m_axi_gmem1_rdata(31 downto 0),
      m_axi_gmem1_rid(0) => m_axi_gmem1_rid(0),
      m_axi_gmem1_rlast => m_axi_gmem1_rlast,
      m_axi_gmem1_rready => m_axi_gmem1_rready,
      m_axi_gmem1_rresp(1 downto 0) => m_axi_gmem1_rresp(1 downto 0),
      m_axi_gmem1_rvalid => m_axi_gmem1_rvalid,
      m_axi_gmem1_wdata(31 downto 0) => m_axi_gmem1_wdata(31 downto 0),
      m_axi_gmem1_wid(0) => m_axi_gmem1_wid(0),
      m_axi_gmem1_wlast => m_axi_gmem1_wlast,
      m_axi_gmem1_wready => m_axi_gmem1_wready,
      m_axi_gmem1_wstrb(3 downto 0) => m_axi_gmem1_wstrb(3 downto 0),
      m_axi_gmem1_wvalid => m_axi_gmem1_wvalid,
      m_axi_gmem2_araddr(63 downto 0) => m_axi_gmem2_araddr(63 downto 0),
      m_axi_gmem2_arburst(1 downto 0) => m_axi_gmem2_arburst(1 downto 0),
      m_axi_gmem2_arcache(3 downto 0) => m_axi_gmem2_arcache(3 downto 0),
      m_axi_gmem2_arid(0) => m_axi_gmem2_arid(0),
      m_axi_gmem2_arlen(7 downto 0) => m_axi_gmem2_arlen(7 downto 0),
      m_axi_gmem2_arlock(1 downto 0) => m_axi_gmem2_arlock(1 downto 0),
      m_axi_gmem2_arprot(2 downto 0) => m_axi_gmem2_arprot(2 downto 0),
      m_axi_gmem2_arqos(3 downto 0) => m_axi_gmem2_arqos(3 downto 0),
      m_axi_gmem2_arready => m_axi_gmem2_arready,
      m_axi_gmem2_arregion(3 downto 0) => m_axi_gmem2_arregion(3 downto 0),
      m_axi_gmem2_arsize(2 downto 0) => m_axi_gmem2_arsize(2 downto 0),
      m_axi_gmem2_arvalid => m_axi_gmem2_arvalid,
      m_axi_gmem2_awaddr(63 downto 0) => m_axi_gmem2_awaddr(63 downto 0),
      m_axi_gmem2_awburst(1 downto 0) => m_axi_gmem2_awburst(1 downto 0),
      m_axi_gmem2_awcache(3 downto 0) => m_axi_gmem2_awcache(3 downto 0),
      m_axi_gmem2_awid(0) => m_axi_gmem2_awid(0),
      m_axi_gmem2_awlen(7 downto 0) => m_axi_gmem2_awlen(7 downto 0),
      m_axi_gmem2_awlock(1 downto 0) => m_axi_gmem2_awlock(1 downto 0),
      m_axi_gmem2_awprot(2 downto 0) => m_axi_gmem2_awprot(2 downto 0),
      m_axi_gmem2_awqos(3 downto 0) => m_axi_gmem2_awqos(3 downto 0),
      m_axi_gmem2_awready => m_axi_gmem2_awready,
      m_axi_gmem2_awregion(3 downto 0) => m_axi_gmem2_awregion(3 downto 0),
      m_axi_gmem2_awsize(2 downto 0) => m_axi_gmem2_awsize(2 downto 0),
      m_axi_gmem2_awvalid => m_axi_gmem2_awvalid,
      m_axi_gmem2_bid(0) => m_axi_gmem2_bid(0),
      m_axi_gmem2_bready => m_axi_gmem2_bready,
      m_axi_gmem2_bresp(1 downto 0) => m_axi_gmem2_bresp(1 downto 0),
      m_axi_gmem2_bvalid => m_axi_gmem2_bvalid,
      m_axi_gmem2_rdata(31 downto 0) => m_axi_gmem2_rdata(31 downto 0),
      m_axi_gmem2_rid(0) => m_axi_gmem2_rid(0),
      m_axi_gmem2_rlast => m_axi_gmem2_rlast,
      m_axi_gmem2_rready => m_axi_gmem2_rready,
      m_axi_gmem2_rresp(1 downto 0) => m_axi_gmem2_rresp(1 downto 0),
      m_axi_gmem2_rvalid => m_axi_gmem2_rvalid,
      m_axi_gmem2_wdata(31 downto 0) => m_axi_gmem2_wdata(31 downto 0),
      m_axi_gmem2_wid(0) => m_axi_gmem2_wid(0),
      m_axi_gmem2_wlast => m_axi_gmem2_wlast,
      m_axi_gmem2_wready => m_axi_gmem2_wready,
      m_axi_gmem2_wstrb(3 downto 0) => m_axi_gmem2_wstrb(3 downto 0),
      m_axi_gmem2_wvalid => m_axi_gmem2_wvalid,
      m_axi_gmem3_araddr(63 downto 0) => m_axi_gmem3_araddr(63 downto 0),
      m_axi_gmem3_arburst(1 downto 0) => m_axi_gmem3_arburst(1 downto 0),
      m_axi_gmem3_arcache(3 downto 0) => m_axi_gmem3_arcache(3 downto 0),
      m_axi_gmem3_arid(0) => m_axi_gmem3_arid(0),
      m_axi_gmem3_arlen(7 downto 0) => m_axi_gmem3_arlen(7 downto 0),
      m_axi_gmem3_arlock(1 downto 0) => m_axi_gmem3_arlock(1 downto 0),
      m_axi_gmem3_arprot(2 downto 0) => m_axi_gmem3_arprot(2 downto 0),
      m_axi_gmem3_arqos(3 downto 0) => m_axi_gmem3_arqos(3 downto 0),
      m_axi_gmem3_arready => m_axi_gmem3_arready,
      m_axi_gmem3_arregion(3 downto 0) => m_axi_gmem3_arregion(3 downto 0),
      m_axi_gmem3_arsize(2 downto 0) => m_axi_gmem3_arsize(2 downto 0),
      m_axi_gmem3_arvalid => m_axi_gmem3_arvalid,
      m_axi_gmem3_awaddr(63 downto 0) => m_axi_gmem3_awaddr(63 downto 0),
      m_axi_gmem3_awburst(1 downto 0) => m_axi_gmem3_awburst(1 downto 0),
      m_axi_gmem3_awcache(3 downto 0) => m_axi_gmem3_awcache(3 downto 0),
      m_axi_gmem3_awid(0) => m_axi_gmem3_awid(0),
      m_axi_gmem3_awlen(7 downto 0) => m_axi_gmem3_awlen(7 downto 0),
      m_axi_gmem3_awlock(1 downto 0) => m_axi_gmem3_awlock(1 downto 0),
      m_axi_gmem3_awprot(2 downto 0) => m_axi_gmem3_awprot(2 downto 0),
      m_axi_gmem3_awqos(3 downto 0) => m_axi_gmem3_awqos(3 downto 0),
      m_axi_gmem3_awready => m_axi_gmem3_awready,
      m_axi_gmem3_awregion(3 downto 0) => m_axi_gmem3_awregion(3 downto 0),
      m_axi_gmem3_awsize(2 downto 0) => m_axi_gmem3_awsize(2 downto 0),
      m_axi_gmem3_awvalid => m_axi_gmem3_awvalid,
      m_axi_gmem3_bid(0) => m_axi_gmem3_bid(0),
      m_axi_gmem3_bready => m_axi_gmem3_bready,
      m_axi_gmem3_bresp(1 downto 0) => m_axi_gmem3_bresp(1 downto 0),
      m_axi_gmem3_bvalid => m_axi_gmem3_bvalid,
      m_axi_gmem3_rdata(31 downto 0) => m_axi_gmem3_rdata(31 downto 0),
      m_axi_gmem3_rid(0) => m_axi_gmem3_rid(0),
      m_axi_gmem3_rlast => m_axi_gmem3_rlast,
      m_axi_gmem3_rready => m_axi_gmem3_rready,
      m_axi_gmem3_rresp(1 downto 0) => m_axi_gmem3_rresp(1 downto 0),
      m_axi_gmem3_rvalid => m_axi_gmem3_rvalid,
      m_axi_gmem3_wdata(31 downto 0) => m_axi_gmem3_wdata(31 downto 0),
      m_axi_gmem3_wid(0) => m_axi_gmem3_wid(0),
      m_axi_gmem3_wlast => m_axi_gmem3_wlast,
      m_axi_gmem3_wready => m_axi_gmem3_wready,
      m_axi_gmem3_wstrb(3 downto 0) => m_axi_gmem3_wstrb(3 downto 0),
      m_axi_gmem3_wvalid => m_axi_gmem3_wvalid,
      s_axi_control_araddr(6 downto 0) => s_axi_control_araddr(6 downto 0),
      s_axi_control_arready => s_axi_control_arready,
      s_axi_control_arvalid => s_axi_control_arvalid,
      s_axi_control_awaddr(6 downto 0) => s_axi_control_awaddr(6 downto 0),
      s_axi_control_awready => s_axi_control_awready,
      s_axi_control_awvalid => s_axi_control_awvalid,
      s_axi_control_bready => s_axi_control_bready,
      s_axi_control_bresp(1 downto 0) => s_axi_control_bresp(1 downto 0),
      s_axi_control_bvalid => s_axi_control_bvalid,
      s_axi_control_rdata(31 downto 0) => s_axi_control_rdata(31 downto 0),
      s_axi_control_rready => s_axi_control_rready,
      s_axi_control_rresp(1 downto 0) => s_axi_control_rresp(1 downto 0),
      s_axi_control_rvalid => s_axi_control_rvalid,
      s_axi_control_wdata(31 downto 0) => s_axi_control_wdata(31 downto 0),
      s_axi_control_wready => s_axi_control_wready,
      s_axi_control_wstrb(3 downto 0) => s_axi_control_wstrb(3 downto 0),
      s_axi_control_wvalid => s_axi_control_wvalid
    );
end STRUCTURE;
