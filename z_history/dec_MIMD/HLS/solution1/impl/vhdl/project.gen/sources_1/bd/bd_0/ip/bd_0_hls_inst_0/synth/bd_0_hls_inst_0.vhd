-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:dec_MIMD:1.0
-- IP Revision: 2113540569

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bd_0_hls_inst_0 IS
  PORT (
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_gmem0_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem0_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem0_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem0_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem0_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem0_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem0_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem0_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem0_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem0_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem0_AWVALID : OUT STD_LOGIC;
    m_axi_gmem0_AWREADY : IN STD_LOGIC;
    m_axi_gmem0_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem0_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem0_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem0_WLAST : OUT STD_LOGIC;
    m_axi_gmem0_WVALID : OUT STD_LOGIC;
    m_axi_gmem0_WREADY : IN STD_LOGIC;
    m_axi_gmem0_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem0_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem0_BVALID : IN STD_LOGIC;
    m_axi_gmem0_BREADY : OUT STD_LOGIC;
    m_axi_gmem0_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem0_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem0_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem0_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem0_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem0_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem0_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem0_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem0_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem0_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem0_ARVALID : OUT STD_LOGIC;
    m_axi_gmem0_ARREADY : IN STD_LOGIC;
    m_axi_gmem0_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem0_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem0_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem0_RLAST : IN STD_LOGIC;
    m_axi_gmem0_RVALID : IN STD_LOGIC;
    m_axi_gmem0_RREADY : OUT STD_LOGIC;
    m_axi_gmem1_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem1_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem1_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem1_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem1_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem1_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem1_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem1_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem1_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem1_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem1_AWVALID : OUT STD_LOGIC;
    m_axi_gmem1_AWREADY : IN STD_LOGIC;
    m_axi_gmem1_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem1_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem1_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem1_WLAST : OUT STD_LOGIC;
    m_axi_gmem1_WVALID : OUT STD_LOGIC;
    m_axi_gmem1_WREADY : IN STD_LOGIC;
    m_axi_gmem1_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem1_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem1_BVALID : IN STD_LOGIC;
    m_axi_gmem1_BREADY : OUT STD_LOGIC;
    m_axi_gmem1_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem1_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem1_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem1_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem1_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem1_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem1_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem1_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem1_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem1_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem1_ARVALID : OUT STD_LOGIC;
    m_axi_gmem1_ARREADY : IN STD_LOGIC;
    m_axi_gmem1_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem1_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem1_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem1_RLAST : IN STD_LOGIC;
    m_axi_gmem1_RVALID : IN STD_LOGIC;
    m_axi_gmem1_RREADY : OUT STD_LOGIC;
    m_axi_gmem2_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem2_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem2_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem2_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem2_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem2_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem2_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem2_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem2_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem2_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem2_AWVALID : OUT STD_LOGIC;
    m_axi_gmem2_AWREADY : IN STD_LOGIC;
    m_axi_gmem2_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem2_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem2_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem2_WLAST : OUT STD_LOGIC;
    m_axi_gmem2_WVALID : OUT STD_LOGIC;
    m_axi_gmem2_WREADY : IN STD_LOGIC;
    m_axi_gmem2_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem2_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem2_BVALID : IN STD_LOGIC;
    m_axi_gmem2_BREADY : OUT STD_LOGIC;
    m_axi_gmem2_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem2_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem2_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem2_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem2_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem2_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem2_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem2_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem2_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem2_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem2_ARVALID : OUT STD_LOGIC;
    m_axi_gmem2_ARREADY : IN STD_LOGIC;
    m_axi_gmem2_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem2_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem2_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem2_RLAST : IN STD_LOGIC;
    m_axi_gmem2_RVALID : IN STD_LOGIC;
    m_axi_gmem2_RREADY : OUT STD_LOGIC;
    m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem3_AWVALID : OUT STD_LOGIC;
    m_axi_gmem3_AWREADY : IN STD_LOGIC;
    m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem3_WLAST : OUT STD_LOGIC;
    m_axi_gmem3_WVALID : OUT STD_LOGIC;
    m_axi_gmem3_WREADY : IN STD_LOGIC;
    m_axi_gmem3_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem3_BVALID : IN STD_LOGIC;
    m_axi_gmem3_BREADY : OUT STD_LOGIC;
    m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem3_ARVALID : OUT STD_LOGIC;
    m_axi_gmem3_ARREADY : IN STD_LOGIC;
    m_axi_gmem3_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem3_RLAST : IN STD_LOGIC;
    m_axi_gmem3_RVALID : IN STD_LOGIC;
    m_axi_gmem3_RREADY : OUT STD_LOGIC
  );
END bd_0_hls_inst_0;

ARCHITECTURE bd_0_hls_inst_0_arch OF bd_0_hls_inst_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF bd_0_hls_inst_0_arch: ARCHITECTURE IS "yes";
  COMPONENT dec_MIMD IS
    GENERIC (
      C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CONTROL_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM0_ID_WIDTH : INTEGER;
      C_M_AXI_GMEM0_ADDR_WIDTH : INTEGER;
      C_M_AXI_GMEM0_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM0_AWUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM0_ARUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM0_WUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM0_RUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM0_BUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM0_USER_VALUE : INTEGER;
      C_M_AXI_GMEM0_PROT_VALUE : INTEGER;
      C_M_AXI_GMEM0_CACHE_VALUE : INTEGER;
      C_M_AXI_GMEM1_ID_WIDTH : INTEGER;
      C_M_AXI_GMEM1_ADDR_WIDTH : INTEGER;
      C_M_AXI_GMEM1_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM1_AWUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM1_ARUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM1_WUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM1_RUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM1_BUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM1_USER_VALUE : INTEGER;
      C_M_AXI_GMEM1_PROT_VALUE : INTEGER;
      C_M_AXI_GMEM1_CACHE_VALUE : INTEGER;
      C_M_AXI_GMEM2_ID_WIDTH : INTEGER;
      C_M_AXI_GMEM2_ADDR_WIDTH : INTEGER;
      C_M_AXI_GMEM2_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM2_AWUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM2_ARUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM2_WUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM2_RUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM2_BUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM2_USER_VALUE : INTEGER;
      C_M_AXI_GMEM2_PROT_VALUE : INTEGER;
      C_M_AXI_GMEM2_CACHE_VALUE : INTEGER;
      C_M_AXI_GMEM3_ID_WIDTH : INTEGER;
      C_M_AXI_GMEM3_ADDR_WIDTH : INTEGER;
      C_M_AXI_GMEM3_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM3_AWUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM3_ARUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM3_WUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM3_RUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM3_BUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM3_USER_VALUE : INTEGER;
      C_M_AXI_GMEM3_PROT_VALUE : INTEGER;
      C_M_AXI_GMEM3_CACHE_VALUE : INTEGER
    );
    PORT (
      s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_control_AWVALID : IN STD_LOGIC;
      s_axi_control_AWREADY : OUT STD_LOGIC;
      s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_WVALID : IN STD_LOGIC;
      s_axi_control_WREADY : OUT STD_LOGIC;
      s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_BVALID : OUT STD_LOGIC;
      s_axi_control_BREADY : IN STD_LOGIC;
      s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_control_ARVALID : IN STD_LOGIC;
      s_axi_control_ARREADY : OUT STD_LOGIC;
      s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_RVALID : OUT STD_LOGIC;
      s_axi_control_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      m_axi_gmem0_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem0_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem0_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem0_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem0_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem0_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem0_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem0_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem0_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem0_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_AWVALID : OUT STD_LOGIC;
      m_axi_gmem0_AWREADY : IN STD_LOGIC;
      m_axi_gmem0_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem0_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem0_WLAST : OUT STD_LOGIC;
      m_axi_gmem0_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_WVALID : OUT STD_LOGIC;
      m_axi_gmem0_WREADY : IN STD_LOGIC;
      m_axi_gmem0_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem0_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_BVALID : IN STD_LOGIC;
      m_axi_gmem0_BREADY : OUT STD_LOGIC;
      m_axi_gmem0_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem0_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem0_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem0_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem0_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem0_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem0_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem0_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem0_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem0_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_ARVALID : OUT STD_LOGIC;
      m_axi_gmem0_ARREADY : IN STD_LOGIC;
      m_axi_gmem0_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem0_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem0_RLAST : IN STD_LOGIC;
      m_axi_gmem0_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem0_RVALID : IN STD_LOGIC;
      m_axi_gmem0_RREADY : OUT STD_LOGIC;
      m_axi_gmem1_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem1_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem1_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem1_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem1_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem1_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem1_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem1_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem1_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem1_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_AWVALID : OUT STD_LOGIC;
      m_axi_gmem1_AWREADY : IN STD_LOGIC;
      m_axi_gmem1_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem1_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem1_WLAST : OUT STD_LOGIC;
      m_axi_gmem1_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_WVALID : OUT STD_LOGIC;
      m_axi_gmem1_WREADY : IN STD_LOGIC;
      m_axi_gmem1_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem1_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_BVALID : IN STD_LOGIC;
      m_axi_gmem1_BREADY : OUT STD_LOGIC;
      m_axi_gmem1_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem1_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem1_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem1_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem1_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem1_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem1_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem1_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem1_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem1_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_ARVALID : OUT STD_LOGIC;
      m_axi_gmem1_ARREADY : IN STD_LOGIC;
      m_axi_gmem1_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem1_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem1_RLAST : IN STD_LOGIC;
      m_axi_gmem1_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem1_RVALID : IN STD_LOGIC;
      m_axi_gmem1_RREADY : OUT STD_LOGIC;
      m_axi_gmem2_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem2_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem2_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem2_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem2_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem2_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem2_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem2_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem2_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem2_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_AWVALID : OUT STD_LOGIC;
      m_axi_gmem2_AWREADY : IN STD_LOGIC;
      m_axi_gmem2_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem2_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem2_WLAST : OUT STD_LOGIC;
      m_axi_gmem2_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_WVALID : OUT STD_LOGIC;
      m_axi_gmem2_WREADY : IN STD_LOGIC;
      m_axi_gmem2_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem2_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_BVALID : IN STD_LOGIC;
      m_axi_gmem2_BREADY : OUT STD_LOGIC;
      m_axi_gmem2_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem2_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem2_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem2_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem2_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem2_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem2_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem2_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem2_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem2_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_ARVALID : OUT STD_LOGIC;
      m_axi_gmem2_ARREADY : IN STD_LOGIC;
      m_axi_gmem2_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem2_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem2_RLAST : IN STD_LOGIC;
      m_axi_gmem2_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem2_RVALID : IN STD_LOGIC;
      m_axi_gmem2_RREADY : OUT STD_LOGIC;
      m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem3_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_AWVALID : OUT STD_LOGIC;
      m_axi_gmem3_AWREADY : IN STD_LOGIC;
      m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem3_WLAST : OUT STD_LOGIC;
      m_axi_gmem3_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_WVALID : OUT STD_LOGIC;
      m_axi_gmem3_WREADY : IN STD_LOGIC;
      m_axi_gmem3_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem3_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_BVALID : IN STD_LOGIC;
      m_axi_gmem3_BREADY : OUT STD_LOGIC;
      m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem3_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_ARVALID : OUT STD_LOGIC;
      m_axi_gmem3_ARREADY : IN STD_LOGIC;
      m_axi_gmem3_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem3_RLAST : IN STD_LOGIC;
      m_axi_gmem3_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem3_RVALID : IN STD_LOGIC;
      m_axi_gmem3_RREADY : OUT STD_LOGIC
    );
  END COMPONENT dec_MIMD;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF bd_0_hls_inst_0_arch: ARCHITECTURE IS "dec_MIMD,Vivado 2023.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF bd_0_hls_inst_0_arch : ARCHITECTURE IS "bd_0_hls_inst_0,dec_MIMD,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF bd_0_hls_inst_0_arch: ARCHITECTURE IS "bd_0_hls_inst_0,dec_MIMD,{x_ipProduct=Vivado 2023.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=dec_MIMD,x_ipVersion=1.0,x_ipCoreRevision=2113540569,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_ADDR_WIDTH=7,C_S_AXI_CONTROL_DATA_WIDTH=32,C_M_AXI_GMEM0_ID_WIDTH=1,C_M_AXI_GMEM0_ADDR_WIDTH=64,C_M_AXI_GMEM0_DATA_WIDTH=32,C_M_AXI_GMEM0_AWUSER_WIDTH=1,C_M_AXI_GMEM0_ARUSER_WIDTH=1,C_M_AXI_GMEM0_WUSER_WIDTH=1,C_M_AXI_GMEM0_RUSER_WIDTH=1,C_M_AXI_GMEM0_BUSER_WIDTH=1,C_M_AXI_GMEM0_USER_VALUE=0" & 
"x00000000,C_M_AXI_GMEM0_PROT_VALUE=000,C_M_AXI_GMEM0_CACHE_VALUE=0011,C_M_AXI_GMEM1_ID_WIDTH=1,C_M_AXI_GMEM1_ADDR_WIDTH=64,C_M_AXI_GMEM1_DATA_WIDTH=32,C_M_AXI_GMEM1_AWUSER_WIDTH=1,C_M_AXI_GMEM1_ARUSER_WIDTH=1,C_M_AXI_GMEM1_WUSER_WIDTH=1,C_M_AXI_GMEM1_RUSER_WIDTH=1,C_M_AXI_GMEM1_BUSER_WIDTH=1,C_M_AXI_GMEM1_USER_VALUE=0x00000000,C_M_AXI_GMEM1_PROT_VALUE=000,C_M_AXI_GMEM1_CACHE_VALUE=0011,C_M_AXI_GMEM2_ID_WIDTH=1,C_M_AXI_GMEM2_ADDR_WIDTH=64,C_M_AXI_GMEM2_DATA_WIDTH=32,C_M_AXI_GMEM2_AWUSER_WIDTH=1,C" & 
"_M_AXI_GMEM2_ARUSER_WIDTH=1,C_M_AXI_GMEM2_WUSER_WIDTH=1,C_M_AXI_GMEM2_RUSER_WIDTH=1,C_M_AXI_GMEM2_BUSER_WIDTH=1,C_M_AXI_GMEM2_USER_VALUE=0x00000000,C_M_AXI_GMEM2_PROT_VALUE=000,C_M_AXI_GMEM2_CACHE_VALUE=0011,C_M_AXI_GMEM3_ID_WIDTH=1,C_M_AXI_GMEM3_ADDR_WIDTH=64,C_M_AXI_GMEM3_DATA_WIDTH=32,C_M_AXI_GMEM3_AWUSER_WIDTH=1,C_M_AXI_GMEM3_ARUSER_WIDTH=1,C_M_AXI_GMEM3_WUSER_WIDTH=1,C_M_AXI_GMEM3_RUSER_WIDTH=1,C_M_AXI_GMEM3_BUSER_WIDTH=1,C_M_AXI_GMEM3_USER_VALUE=0x00000000,C_M_AXI_GMEM3_PROT_VALUE=000,C_M_" & 
"AXI_GMEM3_CACHE_VALUE=0011}";
  ATTRIBUTE SDX_KERNEL : STRING;
  ATTRIBUTE SDX_KERNEL OF dec_MIMD: COMPONENT IS "true";
  ATTRIBUTE SDX_KERNEL_TYPE : STRING;
  ATTRIBUTE SDX_KERNEL_TYPE OF dec_MIMD: COMPONENT IS "hls";
  ATTRIBUTE SDX_KERNEL_SYNTH_INST : STRING;
  ATTRIBUTE SDX_KERNEL_SYNTH_INST OF dec_MIMD: COMPONENT IS "U0";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF bd_0_hls_inst_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_gmem0:m_axi_gmem1:m_axi_gmem2:m_axi_gmem3, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt: SIGNAL IS "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_gmem0_AWID: SIGNAL IS "XIL_INTERFACENAME m_axi_gmem0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000.0, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN " & 
"bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 BID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 RID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_WID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 WID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem0_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem0 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_gmem1_AWID: SIGNAL IS "XIL_INTERFACENAME m_axi_gmem1, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000.0, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN " & 
"bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_WID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem1_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem1 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_gmem2_AWID: SIGNAL IS "XIL_INTERFACENAME m_axi_gmem2, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000.0, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN" & 
" bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 BID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 RID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_WID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 WID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem2_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem2 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWCACHE";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_gmem3_AWID: SIGNAL IS "XIL_INTERFACENAME m_axi_gmem3, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, MAX_BURST_LENGTH 256, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 100000000.0, ID_WIDTH 1, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.0, CLK_DOMAIN " & 
"bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_BID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 BID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_RID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 RID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_WID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 WID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem3_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem3 WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_control_AWADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 7, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000.0, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREAD" & 
"S 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WVALID";
BEGIN
  U0 : dec_MIMD
    GENERIC MAP (
      C_S_AXI_CONTROL_ADDR_WIDTH => 7,
      C_S_AXI_CONTROL_DATA_WIDTH => 32,
      C_M_AXI_GMEM0_ID_WIDTH => 1,
      C_M_AXI_GMEM0_ADDR_WIDTH => 64,
      C_M_AXI_GMEM0_DATA_WIDTH => 32,
      C_M_AXI_GMEM0_AWUSER_WIDTH => 1,
      C_M_AXI_GMEM0_ARUSER_WIDTH => 1,
      C_M_AXI_GMEM0_WUSER_WIDTH => 1,
      C_M_AXI_GMEM0_RUSER_WIDTH => 1,
      C_M_AXI_GMEM0_BUSER_WIDTH => 1,
      C_M_AXI_GMEM0_USER_VALUE => 0,
      C_M_AXI_GMEM0_PROT_VALUE => 0,
      C_M_AXI_GMEM0_CACHE_VALUE => 3,
      C_M_AXI_GMEM1_ID_WIDTH => 1,
      C_M_AXI_GMEM1_ADDR_WIDTH => 64,
      C_M_AXI_GMEM1_DATA_WIDTH => 32,
      C_M_AXI_GMEM1_AWUSER_WIDTH => 1,
      C_M_AXI_GMEM1_ARUSER_WIDTH => 1,
      C_M_AXI_GMEM1_WUSER_WIDTH => 1,
      C_M_AXI_GMEM1_RUSER_WIDTH => 1,
      C_M_AXI_GMEM1_BUSER_WIDTH => 1,
      C_M_AXI_GMEM1_USER_VALUE => 0,
      C_M_AXI_GMEM1_PROT_VALUE => 0,
      C_M_AXI_GMEM1_CACHE_VALUE => 3,
      C_M_AXI_GMEM2_ID_WIDTH => 1,
      C_M_AXI_GMEM2_ADDR_WIDTH => 64,
      C_M_AXI_GMEM2_DATA_WIDTH => 32,
      C_M_AXI_GMEM2_AWUSER_WIDTH => 1,
      C_M_AXI_GMEM2_ARUSER_WIDTH => 1,
      C_M_AXI_GMEM2_WUSER_WIDTH => 1,
      C_M_AXI_GMEM2_RUSER_WIDTH => 1,
      C_M_AXI_GMEM2_BUSER_WIDTH => 1,
      C_M_AXI_GMEM2_USER_VALUE => 0,
      C_M_AXI_GMEM2_PROT_VALUE => 0,
      C_M_AXI_GMEM2_CACHE_VALUE => 3,
      C_M_AXI_GMEM3_ID_WIDTH => 1,
      C_M_AXI_GMEM3_ADDR_WIDTH => 64,
      C_M_AXI_GMEM3_DATA_WIDTH => 32,
      C_M_AXI_GMEM3_AWUSER_WIDTH => 1,
      C_M_AXI_GMEM3_ARUSER_WIDTH => 1,
      C_M_AXI_GMEM3_WUSER_WIDTH => 1,
      C_M_AXI_GMEM3_RUSER_WIDTH => 1,
      C_M_AXI_GMEM3_BUSER_WIDTH => 1,
      C_M_AXI_GMEM3_USER_VALUE => 0,
      C_M_AXI_GMEM3_PROT_VALUE => 0,
      C_M_AXI_GMEM3_CACHE_VALUE => 3
    )
    PORT MAP (
      s_axi_control_AWADDR => s_axi_control_AWADDR,
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_AWREADY => s_axi_control_AWREADY,
      s_axi_control_WDATA => s_axi_control_WDATA,
      s_axi_control_WSTRB => s_axi_control_WSTRB,
      s_axi_control_WVALID => s_axi_control_WVALID,
      s_axi_control_WREADY => s_axi_control_WREADY,
      s_axi_control_BRESP => s_axi_control_BRESP,
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_ARADDR => s_axi_control_ARADDR,
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_ARREADY => s_axi_control_ARREADY,
      s_axi_control_RDATA => s_axi_control_RDATA,
      s_axi_control_RRESP => s_axi_control_RRESP,
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_RREADY => s_axi_control_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      m_axi_gmem0_AWID => m_axi_gmem0_AWID,
      m_axi_gmem0_AWADDR => m_axi_gmem0_AWADDR,
      m_axi_gmem0_AWLEN => m_axi_gmem0_AWLEN,
      m_axi_gmem0_AWSIZE => m_axi_gmem0_AWSIZE,
      m_axi_gmem0_AWBURST => m_axi_gmem0_AWBURST,
      m_axi_gmem0_AWLOCK => m_axi_gmem0_AWLOCK,
      m_axi_gmem0_AWREGION => m_axi_gmem0_AWREGION,
      m_axi_gmem0_AWCACHE => m_axi_gmem0_AWCACHE,
      m_axi_gmem0_AWPROT => m_axi_gmem0_AWPROT,
      m_axi_gmem0_AWQOS => m_axi_gmem0_AWQOS,
      m_axi_gmem0_AWVALID => m_axi_gmem0_AWVALID,
      m_axi_gmem0_AWREADY => m_axi_gmem0_AWREADY,
      m_axi_gmem0_WID => m_axi_gmem0_WID,
      m_axi_gmem0_WDATA => m_axi_gmem0_WDATA,
      m_axi_gmem0_WSTRB => m_axi_gmem0_WSTRB,
      m_axi_gmem0_WLAST => m_axi_gmem0_WLAST,
      m_axi_gmem0_WVALID => m_axi_gmem0_WVALID,
      m_axi_gmem0_WREADY => m_axi_gmem0_WREADY,
      m_axi_gmem0_BID => m_axi_gmem0_BID,
      m_axi_gmem0_BRESP => m_axi_gmem0_BRESP,
      m_axi_gmem0_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem0_BVALID => m_axi_gmem0_BVALID,
      m_axi_gmem0_BREADY => m_axi_gmem0_BREADY,
      m_axi_gmem0_ARID => m_axi_gmem0_ARID,
      m_axi_gmem0_ARADDR => m_axi_gmem0_ARADDR,
      m_axi_gmem0_ARLEN => m_axi_gmem0_ARLEN,
      m_axi_gmem0_ARSIZE => m_axi_gmem0_ARSIZE,
      m_axi_gmem0_ARBURST => m_axi_gmem0_ARBURST,
      m_axi_gmem0_ARLOCK => m_axi_gmem0_ARLOCK,
      m_axi_gmem0_ARREGION => m_axi_gmem0_ARREGION,
      m_axi_gmem0_ARCACHE => m_axi_gmem0_ARCACHE,
      m_axi_gmem0_ARPROT => m_axi_gmem0_ARPROT,
      m_axi_gmem0_ARQOS => m_axi_gmem0_ARQOS,
      m_axi_gmem0_ARVALID => m_axi_gmem0_ARVALID,
      m_axi_gmem0_ARREADY => m_axi_gmem0_ARREADY,
      m_axi_gmem0_RID => m_axi_gmem0_RID,
      m_axi_gmem0_RDATA => m_axi_gmem0_RDATA,
      m_axi_gmem0_RRESP => m_axi_gmem0_RRESP,
      m_axi_gmem0_RLAST => m_axi_gmem0_RLAST,
      m_axi_gmem0_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem0_RVALID => m_axi_gmem0_RVALID,
      m_axi_gmem0_RREADY => m_axi_gmem0_RREADY,
      m_axi_gmem1_AWID => m_axi_gmem1_AWID,
      m_axi_gmem1_AWADDR => m_axi_gmem1_AWADDR,
      m_axi_gmem1_AWLEN => m_axi_gmem1_AWLEN,
      m_axi_gmem1_AWSIZE => m_axi_gmem1_AWSIZE,
      m_axi_gmem1_AWBURST => m_axi_gmem1_AWBURST,
      m_axi_gmem1_AWLOCK => m_axi_gmem1_AWLOCK,
      m_axi_gmem1_AWREGION => m_axi_gmem1_AWREGION,
      m_axi_gmem1_AWCACHE => m_axi_gmem1_AWCACHE,
      m_axi_gmem1_AWPROT => m_axi_gmem1_AWPROT,
      m_axi_gmem1_AWQOS => m_axi_gmem1_AWQOS,
      m_axi_gmem1_AWVALID => m_axi_gmem1_AWVALID,
      m_axi_gmem1_AWREADY => m_axi_gmem1_AWREADY,
      m_axi_gmem1_WID => m_axi_gmem1_WID,
      m_axi_gmem1_WDATA => m_axi_gmem1_WDATA,
      m_axi_gmem1_WSTRB => m_axi_gmem1_WSTRB,
      m_axi_gmem1_WLAST => m_axi_gmem1_WLAST,
      m_axi_gmem1_WVALID => m_axi_gmem1_WVALID,
      m_axi_gmem1_WREADY => m_axi_gmem1_WREADY,
      m_axi_gmem1_BID => m_axi_gmem1_BID,
      m_axi_gmem1_BRESP => m_axi_gmem1_BRESP,
      m_axi_gmem1_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem1_BVALID => m_axi_gmem1_BVALID,
      m_axi_gmem1_BREADY => m_axi_gmem1_BREADY,
      m_axi_gmem1_ARID => m_axi_gmem1_ARID,
      m_axi_gmem1_ARADDR => m_axi_gmem1_ARADDR,
      m_axi_gmem1_ARLEN => m_axi_gmem1_ARLEN,
      m_axi_gmem1_ARSIZE => m_axi_gmem1_ARSIZE,
      m_axi_gmem1_ARBURST => m_axi_gmem1_ARBURST,
      m_axi_gmem1_ARLOCK => m_axi_gmem1_ARLOCK,
      m_axi_gmem1_ARREGION => m_axi_gmem1_ARREGION,
      m_axi_gmem1_ARCACHE => m_axi_gmem1_ARCACHE,
      m_axi_gmem1_ARPROT => m_axi_gmem1_ARPROT,
      m_axi_gmem1_ARQOS => m_axi_gmem1_ARQOS,
      m_axi_gmem1_ARVALID => m_axi_gmem1_ARVALID,
      m_axi_gmem1_ARREADY => m_axi_gmem1_ARREADY,
      m_axi_gmem1_RID => m_axi_gmem1_RID,
      m_axi_gmem1_RDATA => m_axi_gmem1_RDATA,
      m_axi_gmem1_RRESP => m_axi_gmem1_RRESP,
      m_axi_gmem1_RLAST => m_axi_gmem1_RLAST,
      m_axi_gmem1_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem1_RVALID => m_axi_gmem1_RVALID,
      m_axi_gmem1_RREADY => m_axi_gmem1_RREADY,
      m_axi_gmem2_AWID => m_axi_gmem2_AWID,
      m_axi_gmem2_AWADDR => m_axi_gmem2_AWADDR,
      m_axi_gmem2_AWLEN => m_axi_gmem2_AWLEN,
      m_axi_gmem2_AWSIZE => m_axi_gmem2_AWSIZE,
      m_axi_gmem2_AWBURST => m_axi_gmem2_AWBURST,
      m_axi_gmem2_AWLOCK => m_axi_gmem2_AWLOCK,
      m_axi_gmem2_AWREGION => m_axi_gmem2_AWREGION,
      m_axi_gmem2_AWCACHE => m_axi_gmem2_AWCACHE,
      m_axi_gmem2_AWPROT => m_axi_gmem2_AWPROT,
      m_axi_gmem2_AWQOS => m_axi_gmem2_AWQOS,
      m_axi_gmem2_AWVALID => m_axi_gmem2_AWVALID,
      m_axi_gmem2_AWREADY => m_axi_gmem2_AWREADY,
      m_axi_gmem2_WID => m_axi_gmem2_WID,
      m_axi_gmem2_WDATA => m_axi_gmem2_WDATA,
      m_axi_gmem2_WSTRB => m_axi_gmem2_WSTRB,
      m_axi_gmem2_WLAST => m_axi_gmem2_WLAST,
      m_axi_gmem2_WVALID => m_axi_gmem2_WVALID,
      m_axi_gmem2_WREADY => m_axi_gmem2_WREADY,
      m_axi_gmem2_BID => m_axi_gmem2_BID,
      m_axi_gmem2_BRESP => m_axi_gmem2_BRESP,
      m_axi_gmem2_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem2_BVALID => m_axi_gmem2_BVALID,
      m_axi_gmem2_BREADY => m_axi_gmem2_BREADY,
      m_axi_gmem2_ARID => m_axi_gmem2_ARID,
      m_axi_gmem2_ARADDR => m_axi_gmem2_ARADDR,
      m_axi_gmem2_ARLEN => m_axi_gmem2_ARLEN,
      m_axi_gmem2_ARSIZE => m_axi_gmem2_ARSIZE,
      m_axi_gmem2_ARBURST => m_axi_gmem2_ARBURST,
      m_axi_gmem2_ARLOCK => m_axi_gmem2_ARLOCK,
      m_axi_gmem2_ARREGION => m_axi_gmem2_ARREGION,
      m_axi_gmem2_ARCACHE => m_axi_gmem2_ARCACHE,
      m_axi_gmem2_ARPROT => m_axi_gmem2_ARPROT,
      m_axi_gmem2_ARQOS => m_axi_gmem2_ARQOS,
      m_axi_gmem2_ARVALID => m_axi_gmem2_ARVALID,
      m_axi_gmem2_ARREADY => m_axi_gmem2_ARREADY,
      m_axi_gmem2_RID => m_axi_gmem2_RID,
      m_axi_gmem2_RDATA => m_axi_gmem2_RDATA,
      m_axi_gmem2_RRESP => m_axi_gmem2_RRESP,
      m_axi_gmem2_RLAST => m_axi_gmem2_RLAST,
      m_axi_gmem2_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem2_RVALID => m_axi_gmem2_RVALID,
      m_axi_gmem2_RREADY => m_axi_gmem2_RREADY,
      m_axi_gmem3_AWID => m_axi_gmem3_AWID,
      m_axi_gmem3_AWADDR => m_axi_gmem3_AWADDR,
      m_axi_gmem3_AWLEN => m_axi_gmem3_AWLEN,
      m_axi_gmem3_AWSIZE => m_axi_gmem3_AWSIZE,
      m_axi_gmem3_AWBURST => m_axi_gmem3_AWBURST,
      m_axi_gmem3_AWLOCK => m_axi_gmem3_AWLOCK,
      m_axi_gmem3_AWREGION => m_axi_gmem3_AWREGION,
      m_axi_gmem3_AWCACHE => m_axi_gmem3_AWCACHE,
      m_axi_gmem3_AWPROT => m_axi_gmem3_AWPROT,
      m_axi_gmem3_AWQOS => m_axi_gmem3_AWQOS,
      m_axi_gmem3_AWVALID => m_axi_gmem3_AWVALID,
      m_axi_gmem3_AWREADY => m_axi_gmem3_AWREADY,
      m_axi_gmem3_WID => m_axi_gmem3_WID,
      m_axi_gmem3_WDATA => m_axi_gmem3_WDATA,
      m_axi_gmem3_WSTRB => m_axi_gmem3_WSTRB,
      m_axi_gmem3_WLAST => m_axi_gmem3_WLAST,
      m_axi_gmem3_WVALID => m_axi_gmem3_WVALID,
      m_axi_gmem3_WREADY => m_axi_gmem3_WREADY,
      m_axi_gmem3_BID => m_axi_gmem3_BID,
      m_axi_gmem3_BRESP => m_axi_gmem3_BRESP,
      m_axi_gmem3_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem3_BVALID => m_axi_gmem3_BVALID,
      m_axi_gmem3_BREADY => m_axi_gmem3_BREADY,
      m_axi_gmem3_ARID => m_axi_gmem3_ARID,
      m_axi_gmem3_ARADDR => m_axi_gmem3_ARADDR,
      m_axi_gmem3_ARLEN => m_axi_gmem3_ARLEN,
      m_axi_gmem3_ARSIZE => m_axi_gmem3_ARSIZE,
      m_axi_gmem3_ARBURST => m_axi_gmem3_ARBURST,
      m_axi_gmem3_ARLOCK => m_axi_gmem3_ARLOCK,
      m_axi_gmem3_ARREGION => m_axi_gmem3_ARREGION,
      m_axi_gmem3_ARCACHE => m_axi_gmem3_ARCACHE,
      m_axi_gmem3_ARPROT => m_axi_gmem3_ARPROT,
      m_axi_gmem3_ARQOS => m_axi_gmem3_ARQOS,
      m_axi_gmem3_ARVALID => m_axi_gmem3_ARVALID,
      m_axi_gmem3_ARREADY => m_axi_gmem3_ARREADY,
      m_axi_gmem3_RID => m_axi_gmem3_RID,
      m_axi_gmem3_RDATA => m_axi_gmem3_RDATA,
      m_axi_gmem3_RRESP => m_axi_gmem3_RRESP,
      m_axi_gmem3_RLAST => m_axi_gmem3_RLAST,
      m_axi_gmem3_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem3_RVALID => m_axi_gmem3_RVALID,
      m_axi_gmem3_RREADY => m_axi_gmem3_RREADY
    );
END bd_0_hls_inst_0_arch;
