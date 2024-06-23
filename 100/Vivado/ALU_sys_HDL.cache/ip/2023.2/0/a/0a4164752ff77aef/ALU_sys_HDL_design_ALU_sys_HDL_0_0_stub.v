// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Jun 23 17:23:54 2024
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ALU_sys_HDL_design_ALU_sys_HDL_0_0_stub.v
// Design      : ALU_sys_HDL_design_ALU_sys_HDL_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ALU_sys_HDL,Vivado 2023.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_control_AWVALID, 
  s_axi_control_AWREADY, s_axi_control_AWADDR, s_axi_control_WVALID, 
  s_axi_control_WREADY, s_axi_control_WDATA, s_axi_control_WSTRB, s_axi_control_ARVALID, 
  s_axi_control_ARREADY, s_axi_control_ARADDR, s_axi_control_RVALID, 
  s_axi_control_RREADY, s_axi_control_RDATA, s_axi_control_RRESP, s_axi_control_BVALID, 
  s_axi_control_BREADY, s_axi_control_BRESP, ap_clk, ap_rst_n, interrupt, 
  m_axi_gmem0_AWVALID, m_axi_gmem0_AWREADY, m_axi_gmem0_AWADDR, m_axi_gmem0_AWID, 
  m_axi_gmem0_AWLEN, m_axi_gmem0_AWSIZE, m_axi_gmem0_AWBURST, m_axi_gmem0_AWLOCK, 
  m_axi_gmem0_AWCACHE, m_axi_gmem0_AWPROT, m_axi_gmem0_AWQOS, m_axi_gmem0_AWREGION, 
  m_axi_gmem0_AWUSER, m_axi_gmem0_WVALID, m_axi_gmem0_WREADY, m_axi_gmem0_WDATA, 
  m_axi_gmem0_WSTRB, m_axi_gmem0_WLAST, m_axi_gmem0_WID, m_axi_gmem0_WUSER, 
  m_axi_gmem0_ARVALID, m_axi_gmem0_ARREADY, m_axi_gmem0_ARADDR, m_axi_gmem0_ARID, 
  m_axi_gmem0_ARLEN, m_axi_gmem0_ARSIZE, m_axi_gmem0_ARBURST, m_axi_gmem0_ARLOCK, 
  m_axi_gmem0_ARCACHE, m_axi_gmem0_ARPROT, m_axi_gmem0_ARQOS, m_axi_gmem0_ARREGION, 
  m_axi_gmem0_ARUSER, m_axi_gmem0_RVALID, m_axi_gmem0_RREADY, m_axi_gmem0_RDATA, 
  m_axi_gmem0_RLAST, m_axi_gmem0_RID, m_axi_gmem0_RUSER, m_axi_gmem0_RRESP, 
  m_axi_gmem0_BVALID, m_axi_gmem0_BREADY, m_axi_gmem0_BRESP, m_axi_gmem0_BID, 
  m_axi_gmem0_BUSER, m_axi_gmem1_AWVALID, m_axi_gmem1_AWREADY, m_axi_gmem1_AWADDR, 
  m_axi_gmem1_AWID, m_axi_gmem1_AWLEN, m_axi_gmem1_AWSIZE, m_axi_gmem1_AWBURST, 
  m_axi_gmem1_AWLOCK, m_axi_gmem1_AWCACHE, m_axi_gmem1_AWPROT, m_axi_gmem1_AWQOS, 
  m_axi_gmem1_AWREGION, m_axi_gmem1_AWUSER, m_axi_gmem1_WVALID, m_axi_gmem1_WREADY, 
  m_axi_gmem1_WDATA, m_axi_gmem1_WSTRB, m_axi_gmem1_WLAST, m_axi_gmem1_WID, 
  m_axi_gmem1_WUSER, m_axi_gmem1_ARVALID, m_axi_gmem1_ARREADY, m_axi_gmem1_ARADDR, 
  m_axi_gmem1_ARID, m_axi_gmem1_ARLEN, m_axi_gmem1_ARSIZE, m_axi_gmem1_ARBURST, 
  m_axi_gmem1_ARLOCK, m_axi_gmem1_ARCACHE, m_axi_gmem1_ARPROT, m_axi_gmem1_ARQOS, 
  m_axi_gmem1_ARREGION, m_axi_gmem1_ARUSER, m_axi_gmem1_RVALID, m_axi_gmem1_RREADY, 
  m_axi_gmem1_RDATA, m_axi_gmem1_RLAST, m_axi_gmem1_RID, m_axi_gmem1_RUSER, 
  m_axi_gmem1_RRESP, m_axi_gmem1_BVALID, m_axi_gmem1_BREADY, m_axi_gmem1_BRESP, 
  m_axi_gmem1_BID, m_axi_gmem1_BUSER, m_axi_gmem2_AWVALID, m_axi_gmem2_AWREADY, 
  m_axi_gmem2_AWADDR, m_axi_gmem2_AWID, m_axi_gmem2_AWLEN, m_axi_gmem2_AWSIZE, 
  m_axi_gmem2_AWBURST, m_axi_gmem2_AWLOCK, m_axi_gmem2_AWCACHE, m_axi_gmem2_AWPROT, 
  m_axi_gmem2_AWQOS, m_axi_gmem2_AWREGION, m_axi_gmem2_AWUSER, m_axi_gmem2_WVALID, 
  m_axi_gmem2_WREADY, m_axi_gmem2_WDATA, m_axi_gmem2_WSTRB, m_axi_gmem2_WLAST, 
  m_axi_gmem2_WID, m_axi_gmem2_WUSER, m_axi_gmem2_ARVALID, m_axi_gmem2_ARREADY, 
  m_axi_gmem2_ARADDR, m_axi_gmem2_ARID, m_axi_gmem2_ARLEN, m_axi_gmem2_ARSIZE, 
  m_axi_gmem2_ARBURST, m_axi_gmem2_ARLOCK, m_axi_gmem2_ARCACHE, m_axi_gmem2_ARPROT, 
  m_axi_gmem2_ARQOS, m_axi_gmem2_ARREGION, m_axi_gmem2_ARUSER, m_axi_gmem2_RVALID, 
  m_axi_gmem2_RREADY, m_axi_gmem2_RDATA, m_axi_gmem2_RLAST, m_axi_gmem2_RID, 
  m_axi_gmem2_RUSER, m_axi_gmem2_RRESP, m_axi_gmem2_BVALID, m_axi_gmem2_BREADY, 
  m_axi_gmem2_BRESP, m_axi_gmem2_BID, m_axi_gmem2_BUSER, m_axi_gmem3_AWVALID, 
  m_axi_gmem3_AWREADY, m_axi_gmem3_AWADDR, m_axi_gmem3_AWID, m_axi_gmem3_AWLEN, 
  m_axi_gmem3_AWSIZE, m_axi_gmem3_AWBURST, m_axi_gmem3_AWLOCK, m_axi_gmem3_AWCACHE, 
  m_axi_gmem3_AWPROT, m_axi_gmem3_AWQOS, m_axi_gmem3_AWREGION, m_axi_gmem3_AWUSER, 
  m_axi_gmem3_WVALID, m_axi_gmem3_WREADY, m_axi_gmem3_WDATA, m_axi_gmem3_WSTRB, 
  m_axi_gmem3_WLAST, m_axi_gmem3_WID, m_axi_gmem3_WUSER, m_axi_gmem3_ARVALID, 
  m_axi_gmem3_ARREADY, m_axi_gmem3_ARADDR, m_axi_gmem3_ARID, m_axi_gmem3_ARLEN, 
  m_axi_gmem3_ARSIZE, m_axi_gmem3_ARBURST, m_axi_gmem3_ARLOCK, m_axi_gmem3_ARCACHE, 
  m_axi_gmem3_ARPROT, m_axi_gmem3_ARQOS, m_axi_gmem3_ARREGION, m_axi_gmem3_ARUSER, 
  m_axi_gmem3_RVALID, m_axi_gmem3_RREADY, m_axi_gmem3_RDATA, m_axi_gmem3_RLAST, 
  m_axi_gmem3_RID, m_axi_gmem3_RUSER, m_axi_gmem3_RRESP, m_axi_gmem3_BVALID, 
  m_axi_gmem3_BREADY, m_axi_gmem3_BRESP, m_axi_gmem3_BID, m_axi_gmem3_BUSER)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_AWADDR[6:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_ARADDR[6:0],s_axi_control_RVALID,s_axi_control_RREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_BRESP[1:0],ap_rst_n,interrupt,m_axi_gmem0_AWVALID,m_axi_gmem0_AWREADY,m_axi_gmem0_AWADDR[63:0],m_axi_gmem0_AWID[0:0],m_axi_gmem0_AWLEN[7:0],m_axi_gmem0_AWSIZE[2:0],m_axi_gmem0_AWBURST[1:0],m_axi_gmem0_AWLOCK[1:0],m_axi_gmem0_AWCACHE[3:0],m_axi_gmem0_AWPROT[2:0],m_axi_gmem0_AWQOS[3:0],m_axi_gmem0_AWREGION[3:0],m_axi_gmem0_AWUSER[0:0],m_axi_gmem0_WVALID,m_axi_gmem0_WREADY,m_axi_gmem0_WDATA[31:0],m_axi_gmem0_WSTRB[3:0],m_axi_gmem0_WLAST,m_axi_gmem0_WID[0:0],m_axi_gmem0_WUSER[0:0],m_axi_gmem0_ARVALID,m_axi_gmem0_ARREADY,m_axi_gmem0_ARADDR[63:0],m_axi_gmem0_ARID[0:0],m_axi_gmem0_ARLEN[7:0],m_axi_gmem0_ARSIZE[2:0],m_axi_gmem0_ARBURST[1:0],m_axi_gmem0_ARLOCK[1:0],m_axi_gmem0_ARCACHE[3:0],m_axi_gmem0_ARPROT[2:0],m_axi_gmem0_ARQOS[3:0],m_axi_gmem0_ARREGION[3:0],m_axi_gmem0_ARUSER[0:0],m_axi_gmem0_RVALID,m_axi_gmem0_RREADY,m_axi_gmem0_RDATA[31:0],m_axi_gmem0_RLAST,m_axi_gmem0_RID[0:0],m_axi_gmem0_RUSER[0:0],m_axi_gmem0_RRESP[1:0],m_axi_gmem0_BVALID,m_axi_gmem0_BREADY,m_axi_gmem0_BRESP[1:0],m_axi_gmem0_BID[0:0],m_axi_gmem0_BUSER[0:0],m_axi_gmem1_AWVALID,m_axi_gmem1_AWREADY,m_axi_gmem1_AWADDR[63:0],m_axi_gmem1_AWID[0:0],m_axi_gmem1_AWLEN[7:0],m_axi_gmem1_AWSIZE[2:0],m_axi_gmem1_AWBURST[1:0],m_axi_gmem1_AWLOCK[1:0],m_axi_gmem1_AWCACHE[3:0],m_axi_gmem1_AWPROT[2:0],m_axi_gmem1_AWQOS[3:0],m_axi_gmem1_AWREGION[3:0],m_axi_gmem1_AWUSER[0:0],m_axi_gmem1_WVALID,m_axi_gmem1_WREADY,m_axi_gmem1_WDATA[31:0],m_axi_gmem1_WSTRB[3:0],m_axi_gmem1_WLAST,m_axi_gmem1_WID[0:0],m_axi_gmem1_WUSER[0:0],m_axi_gmem1_ARVALID,m_axi_gmem1_ARREADY,m_axi_gmem1_ARADDR[63:0],m_axi_gmem1_ARID[0:0],m_axi_gmem1_ARLEN[7:0],m_axi_gmem1_ARSIZE[2:0],m_axi_gmem1_ARBURST[1:0],m_axi_gmem1_ARLOCK[1:0],m_axi_gmem1_ARCACHE[3:0],m_axi_gmem1_ARPROT[2:0],m_axi_gmem1_ARQOS[3:0],m_axi_gmem1_ARREGION[3:0],m_axi_gmem1_ARUSER[0:0],m_axi_gmem1_RVALID,m_axi_gmem1_RREADY,m_axi_gmem1_RDATA[31:0],m_axi_gmem1_RLAST,m_axi_gmem1_RID[0:0],m_axi_gmem1_RUSER[0:0],m_axi_gmem1_RRESP[1:0],m_axi_gmem1_BVALID,m_axi_gmem1_BREADY,m_axi_gmem1_BRESP[1:0],m_axi_gmem1_BID[0:0],m_axi_gmem1_BUSER[0:0],m_axi_gmem2_AWVALID,m_axi_gmem2_AWREADY,m_axi_gmem2_AWADDR[63:0],m_axi_gmem2_AWID[0:0],m_axi_gmem2_AWLEN[7:0],m_axi_gmem2_AWSIZE[2:0],m_axi_gmem2_AWBURST[1:0],m_axi_gmem2_AWLOCK[1:0],m_axi_gmem2_AWCACHE[3:0],m_axi_gmem2_AWPROT[2:0],m_axi_gmem2_AWQOS[3:0],m_axi_gmem2_AWREGION[3:0],m_axi_gmem2_AWUSER[0:0],m_axi_gmem2_WVALID,m_axi_gmem2_WREADY,m_axi_gmem2_WDATA[31:0],m_axi_gmem2_WSTRB[3:0],m_axi_gmem2_WLAST,m_axi_gmem2_WID[0:0],m_axi_gmem2_WUSER[0:0],m_axi_gmem2_ARVALID,m_axi_gmem2_ARREADY,m_axi_gmem2_ARADDR[63:0],m_axi_gmem2_ARID[0:0],m_axi_gmem2_ARLEN[7:0],m_axi_gmem2_ARSIZE[2:0],m_axi_gmem2_ARBURST[1:0],m_axi_gmem2_ARLOCK[1:0],m_axi_gmem2_ARCACHE[3:0],m_axi_gmem2_ARPROT[2:0],m_axi_gmem2_ARQOS[3:0],m_axi_gmem2_ARREGION[3:0],m_axi_gmem2_ARUSER[0:0],m_axi_gmem2_RVALID,m_axi_gmem2_RREADY,m_axi_gmem2_RDATA[31:0],m_axi_gmem2_RLAST,m_axi_gmem2_RID[0:0],m_axi_gmem2_RUSER[0:0],m_axi_gmem2_RRESP[1:0],m_axi_gmem2_BVALID,m_axi_gmem2_BREADY,m_axi_gmem2_BRESP[1:0],m_axi_gmem2_BID[0:0],m_axi_gmem2_BUSER[0:0],m_axi_gmem3_AWVALID,m_axi_gmem3_AWREADY,m_axi_gmem3_AWADDR[63:0],m_axi_gmem3_AWID[0:0],m_axi_gmem3_AWLEN[7:0],m_axi_gmem3_AWSIZE[2:0],m_axi_gmem3_AWBURST[1:0],m_axi_gmem3_AWLOCK[1:0],m_axi_gmem3_AWCACHE[3:0],m_axi_gmem3_AWPROT[2:0],m_axi_gmem3_AWQOS[3:0],m_axi_gmem3_AWREGION[3:0],m_axi_gmem3_AWUSER[0:0],m_axi_gmem3_WVALID,m_axi_gmem3_WREADY,m_axi_gmem3_WDATA[31:0],m_axi_gmem3_WSTRB[3:0],m_axi_gmem3_WLAST,m_axi_gmem3_WID[0:0],m_axi_gmem3_WUSER[0:0],m_axi_gmem3_ARVALID,m_axi_gmem3_ARREADY,m_axi_gmem3_ARADDR[63:0],m_axi_gmem3_ARID[0:0],m_axi_gmem3_ARLEN[7:0],m_axi_gmem3_ARSIZE[2:0],m_axi_gmem3_ARBURST[1:0],m_axi_gmem3_ARLOCK[1:0],m_axi_gmem3_ARCACHE[3:0],m_axi_gmem3_ARPROT[2:0],m_axi_gmem3_ARQOS[3:0],m_axi_gmem3_ARREGION[3:0],m_axi_gmem3_ARUSER[0:0],m_axi_gmem3_RVALID,m_axi_gmem3_RREADY,m_axi_gmem3_RDATA[31:0],m_axi_gmem3_RLAST,m_axi_gmem3_RID[0:0],m_axi_gmem3_RUSER[0:0],m_axi_gmem3_RRESP[1:0],m_axi_gmem3_BVALID,m_axi_gmem3_BREADY,m_axi_gmem3_BRESP[1:0],m_axi_gmem3_BID[0:0],m_axi_gmem3_BUSER[0:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [6:0]s_axi_control_AWADDR;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  input [6:0]s_axi_control_ARADDR;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  output [1:0]s_axi_control_BRESP;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst_n;
  output interrupt;
  output m_axi_gmem0_AWVALID;
  input m_axi_gmem0_AWREADY;
  output [63:0]m_axi_gmem0_AWADDR;
  output [0:0]m_axi_gmem0_AWID;
  output [7:0]m_axi_gmem0_AWLEN;
  output [2:0]m_axi_gmem0_AWSIZE;
  output [1:0]m_axi_gmem0_AWBURST;
  output [1:0]m_axi_gmem0_AWLOCK;
  output [3:0]m_axi_gmem0_AWCACHE;
  output [2:0]m_axi_gmem0_AWPROT;
  output [3:0]m_axi_gmem0_AWQOS;
  output [3:0]m_axi_gmem0_AWREGION;
  output [0:0]m_axi_gmem0_AWUSER;
  output m_axi_gmem0_WVALID;
  input m_axi_gmem0_WREADY;
  output [31:0]m_axi_gmem0_WDATA;
  output [3:0]m_axi_gmem0_WSTRB;
  output m_axi_gmem0_WLAST;
  output [0:0]m_axi_gmem0_WID;
  output [0:0]m_axi_gmem0_WUSER;
  output m_axi_gmem0_ARVALID;
  input m_axi_gmem0_ARREADY;
  output [63:0]m_axi_gmem0_ARADDR;
  output [0:0]m_axi_gmem0_ARID;
  output [7:0]m_axi_gmem0_ARLEN;
  output [2:0]m_axi_gmem0_ARSIZE;
  output [1:0]m_axi_gmem0_ARBURST;
  output [1:0]m_axi_gmem0_ARLOCK;
  output [3:0]m_axi_gmem0_ARCACHE;
  output [2:0]m_axi_gmem0_ARPROT;
  output [3:0]m_axi_gmem0_ARQOS;
  output [3:0]m_axi_gmem0_ARREGION;
  output [0:0]m_axi_gmem0_ARUSER;
  input m_axi_gmem0_RVALID;
  output m_axi_gmem0_RREADY;
  input [31:0]m_axi_gmem0_RDATA;
  input m_axi_gmem0_RLAST;
  input [0:0]m_axi_gmem0_RID;
  input [0:0]m_axi_gmem0_RUSER;
  input [1:0]m_axi_gmem0_RRESP;
  input m_axi_gmem0_BVALID;
  output m_axi_gmem0_BREADY;
  input [1:0]m_axi_gmem0_BRESP;
  input [0:0]m_axi_gmem0_BID;
  input [0:0]m_axi_gmem0_BUSER;
  output m_axi_gmem1_AWVALID;
  input m_axi_gmem1_AWREADY;
  output [63:0]m_axi_gmem1_AWADDR;
  output [0:0]m_axi_gmem1_AWID;
  output [7:0]m_axi_gmem1_AWLEN;
  output [2:0]m_axi_gmem1_AWSIZE;
  output [1:0]m_axi_gmem1_AWBURST;
  output [1:0]m_axi_gmem1_AWLOCK;
  output [3:0]m_axi_gmem1_AWCACHE;
  output [2:0]m_axi_gmem1_AWPROT;
  output [3:0]m_axi_gmem1_AWQOS;
  output [3:0]m_axi_gmem1_AWREGION;
  output [0:0]m_axi_gmem1_AWUSER;
  output m_axi_gmem1_WVALID;
  input m_axi_gmem1_WREADY;
  output [31:0]m_axi_gmem1_WDATA;
  output [3:0]m_axi_gmem1_WSTRB;
  output m_axi_gmem1_WLAST;
  output [0:0]m_axi_gmem1_WID;
  output [0:0]m_axi_gmem1_WUSER;
  output m_axi_gmem1_ARVALID;
  input m_axi_gmem1_ARREADY;
  output [63:0]m_axi_gmem1_ARADDR;
  output [0:0]m_axi_gmem1_ARID;
  output [7:0]m_axi_gmem1_ARLEN;
  output [2:0]m_axi_gmem1_ARSIZE;
  output [1:0]m_axi_gmem1_ARBURST;
  output [1:0]m_axi_gmem1_ARLOCK;
  output [3:0]m_axi_gmem1_ARCACHE;
  output [2:0]m_axi_gmem1_ARPROT;
  output [3:0]m_axi_gmem1_ARQOS;
  output [3:0]m_axi_gmem1_ARREGION;
  output [0:0]m_axi_gmem1_ARUSER;
  input m_axi_gmem1_RVALID;
  output m_axi_gmem1_RREADY;
  input [31:0]m_axi_gmem1_RDATA;
  input m_axi_gmem1_RLAST;
  input [0:0]m_axi_gmem1_RID;
  input [0:0]m_axi_gmem1_RUSER;
  input [1:0]m_axi_gmem1_RRESP;
  input m_axi_gmem1_BVALID;
  output m_axi_gmem1_BREADY;
  input [1:0]m_axi_gmem1_BRESP;
  input [0:0]m_axi_gmem1_BID;
  input [0:0]m_axi_gmem1_BUSER;
  output m_axi_gmem2_AWVALID;
  input m_axi_gmem2_AWREADY;
  output [63:0]m_axi_gmem2_AWADDR;
  output [0:0]m_axi_gmem2_AWID;
  output [7:0]m_axi_gmem2_AWLEN;
  output [2:0]m_axi_gmem2_AWSIZE;
  output [1:0]m_axi_gmem2_AWBURST;
  output [1:0]m_axi_gmem2_AWLOCK;
  output [3:0]m_axi_gmem2_AWCACHE;
  output [2:0]m_axi_gmem2_AWPROT;
  output [3:0]m_axi_gmem2_AWQOS;
  output [3:0]m_axi_gmem2_AWREGION;
  output [0:0]m_axi_gmem2_AWUSER;
  output m_axi_gmem2_WVALID;
  input m_axi_gmem2_WREADY;
  output [31:0]m_axi_gmem2_WDATA;
  output [3:0]m_axi_gmem2_WSTRB;
  output m_axi_gmem2_WLAST;
  output [0:0]m_axi_gmem2_WID;
  output [0:0]m_axi_gmem2_WUSER;
  output m_axi_gmem2_ARVALID;
  input m_axi_gmem2_ARREADY;
  output [63:0]m_axi_gmem2_ARADDR;
  output [0:0]m_axi_gmem2_ARID;
  output [7:0]m_axi_gmem2_ARLEN;
  output [2:0]m_axi_gmem2_ARSIZE;
  output [1:0]m_axi_gmem2_ARBURST;
  output [1:0]m_axi_gmem2_ARLOCK;
  output [3:0]m_axi_gmem2_ARCACHE;
  output [2:0]m_axi_gmem2_ARPROT;
  output [3:0]m_axi_gmem2_ARQOS;
  output [3:0]m_axi_gmem2_ARREGION;
  output [0:0]m_axi_gmem2_ARUSER;
  input m_axi_gmem2_RVALID;
  output m_axi_gmem2_RREADY;
  input [31:0]m_axi_gmem2_RDATA;
  input m_axi_gmem2_RLAST;
  input [0:0]m_axi_gmem2_RID;
  input [0:0]m_axi_gmem2_RUSER;
  input [1:0]m_axi_gmem2_RRESP;
  input m_axi_gmem2_BVALID;
  output m_axi_gmem2_BREADY;
  input [1:0]m_axi_gmem2_BRESP;
  input [0:0]m_axi_gmem2_BID;
  input [0:0]m_axi_gmem2_BUSER;
  output m_axi_gmem3_AWVALID;
  input m_axi_gmem3_AWREADY;
  output [63:0]m_axi_gmem3_AWADDR;
  output [0:0]m_axi_gmem3_AWID;
  output [7:0]m_axi_gmem3_AWLEN;
  output [2:0]m_axi_gmem3_AWSIZE;
  output [1:0]m_axi_gmem3_AWBURST;
  output [1:0]m_axi_gmem3_AWLOCK;
  output [3:0]m_axi_gmem3_AWCACHE;
  output [2:0]m_axi_gmem3_AWPROT;
  output [3:0]m_axi_gmem3_AWQOS;
  output [3:0]m_axi_gmem3_AWREGION;
  output [0:0]m_axi_gmem3_AWUSER;
  output m_axi_gmem3_WVALID;
  input m_axi_gmem3_WREADY;
  output [31:0]m_axi_gmem3_WDATA;
  output [3:0]m_axi_gmem3_WSTRB;
  output m_axi_gmem3_WLAST;
  output [0:0]m_axi_gmem3_WID;
  output [0:0]m_axi_gmem3_WUSER;
  output m_axi_gmem3_ARVALID;
  input m_axi_gmem3_ARREADY;
  output [63:0]m_axi_gmem3_ARADDR;
  output [0:0]m_axi_gmem3_ARID;
  output [7:0]m_axi_gmem3_ARLEN;
  output [2:0]m_axi_gmem3_ARSIZE;
  output [1:0]m_axi_gmem3_ARBURST;
  output [1:0]m_axi_gmem3_ARLOCK;
  output [3:0]m_axi_gmem3_ARCACHE;
  output [2:0]m_axi_gmem3_ARPROT;
  output [3:0]m_axi_gmem3_ARQOS;
  output [3:0]m_axi_gmem3_ARREGION;
  output [0:0]m_axi_gmem3_ARUSER;
  input m_axi_gmem3_RVALID;
  output m_axi_gmem3_RREADY;
  input [31:0]m_axi_gmem3_RDATA;
  input m_axi_gmem3_RLAST;
  input [0:0]m_axi_gmem3_RID;
  input [0:0]m_axi_gmem3_RUSER;
  input [1:0]m_axi_gmem3_RRESP;
  input m_axi_gmem3_BVALID;
  output m_axi_gmem3_BREADY;
  input [1:0]m_axi_gmem3_BRESP;
  input [0:0]m_axi_gmem3_BID;
  input [0:0]m_axi_gmem3_BUSER;
endmodule
