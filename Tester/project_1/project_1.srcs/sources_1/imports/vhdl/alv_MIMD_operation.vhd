-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alv_MIMD_operation is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_gmem3_AWVALID : OUT STD_LOGIC;
    m_axi_gmem3_AWREADY : IN STD_LOGIC;
    m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_WVALID : OUT STD_LOGIC;
    m_axi_gmem3_WREADY : IN STD_LOGIC;
    m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_WLAST : OUT STD_LOGIC;
    m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_ARVALID : OUT STD_LOGIC;
    m_axi_gmem3_ARREADY : IN STD_LOGIC;
    m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem3_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_RVALID : IN STD_LOGIC;
    m_axi_gmem3_RREADY : OUT STD_LOGIC;
    m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem3_RLAST : IN STD_LOGIC;
    m_axi_gmem3_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
    m_axi_gmem3_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_BVALID : IN STD_LOGIC;
    m_axi_gmem3_BREADY : OUT STD_LOGIC;
    m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem3_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem3_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    op : IN STD_LOGIC_VECTOR (63 downto 0);
    ALU_operation_MEM_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    ALU_operation_MEM_ce0 : OUT STD_LOGIC;
    ALU_operation_MEM_we0 : OUT STD_LOGIC;
    ALU_operation_MEM_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ALU_operation_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    ALU_operation_empty_n : IN STD_LOGIC;
    ALU_operation_read : OUT STD_LOGIC;
    ALU_operation_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    ALU_operation_full_n : IN STD_LOGIC;
    ALU_operation_write : OUT STD_LOGIC );
end;


architecture behav of alv_MIMD_operation is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_operation_Pipeline_l_operation_fu_42_ap_start : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_ap_done : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_ap_idle : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_ap_ready : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWVALID : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WVALID : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WDATA : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WSTRB : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WLAST : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARVALID : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_RREADY : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_BREADY : STD_LOGIC;
    signal grp_operation_Pipeline_l_operation_fu_42_ALU_operation_din : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_ALU_operation_write : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ap_idle : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ap_ready : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_read : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_ce0 : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_we0 : STD_LOGIC;
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_operation_Pipeline_l_operation_fu_42_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component alv_MIMD_operation_Pipeline_l_operation IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        m_axi_gmem3_AWVALID : OUT STD_LOGIC;
        m_axi_gmem3_AWREADY : IN STD_LOGIC;
        m_axi_gmem3_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_WVALID : OUT STD_LOGIC;
        m_axi_gmem3_WREADY : IN STD_LOGIC;
        m_axi_gmem3_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_WLAST : OUT STD_LOGIC;
        m_axi_gmem3_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_ARVALID : OUT STD_LOGIC;
        m_axi_gmem3_ARREADY : IN STD_LOGIC;
        m_axi_gmem3_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_gmem3_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_gmem3_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_gmem3_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RVALID : IN STD_LOGIC;
        m_axi_gmem3_RREADY : OUT STD_LOGIC;
        m_axi_gmem3_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
        m_axi_gmem3_RLAST : IN STD_LOGIC;
        m_axi_gmem3_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
        m_axi_gmem3_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_BVALID : IN STD_LOGIC;
        m_axi_gmem3_BREADY : OUT STD_LOGIC;
        m_axi_gmem3_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_gmem3_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_gmem3_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        ALU_operation_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        ALU_operation_full_n : IN STD_LOGIC;
        ALU_operation_write : OUT STD_LOGIC;
        op : IN STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component alv_MIMD_operation_Pipeline_s_operation_data_op IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ALU_operation_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        ALU_operation_empty_n : IN STD_LOGIC;
        ALU_operation_read : OUT STD_LOGIC;
        ALU_operation_MEM_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
        ALU_operation_MEM_ce0 : OUT STD_LOGIC;
        ALU_operation_MEM_we0 : OUT STD_LOGIC;
        ALU_operation_MEM_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    grp_operation_Pipeline_l_operation_fu_42 : component alv_MIMD_operation_Pipeline_l_operation
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_operation_Pipeline_l_operation_fu_42_ap_start,
        ap_done => grp_operation_Pipeline_l_operation_fu_42_ap_done,
        ap_idle => grp_operation_Pipeline_l_operation_fu_42_ap_idle,
        ap_ready => grp_operation_Pipeline_l_operation_fu_42_ap_ready,
        m_axi_gmem3_AWVALID => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY => ap_const_logic_0,
        m_axi_gmem3_AWADDR => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY => ap_const_logic_0,
        m_axi_gmem3_WDATA => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WLAST,
        m_axi_gmem3_WID => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WID,
        m_axi_gmem3_WUSER => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY => m_axi_gmem3_ARREADY,
        m_axi_gmem3_ARADDR => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID => m_axi_gmem3_RVALID,
        m_axi_gmem3_RREADY => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA => m_axi_gmem3_RDATA,
        m_axi_gmem3_RLAST => m_axi_gmem3_RLAST,
        m_axi_gmem3_RID => m_axi_gmem3_RID,
        m_axi_gmem3_RFIFONUM => m_axi_gmem3_RFIFONUM,
        m_axi_gmem3_RUSER => m_axi_gmem3_RUSER,
        m_axi_gmem3_RRESP => m_axi_gmem3_RRESP,
        m_axi_gmem3_BVALID => ap_const_logic_0,
        m_axi_gmem3_BREADY => grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP => ap_const_lv2_0,
        m_axi_gmem3_BID => ap_const_lv1_0,
        m_axi_gmem3_BUSER => ap_const_lv1_0,
        ALU_operation_din => grp_operation_Pipeline_l_operation_fu_42_ALU_operation_din,
        ALU_operation_full_n => ALU_operation_full_n,
        ALU_operation_write => grp_operation_Pipeline_l_operation_fu_42_ALU_operation_write,
        op => op);

    grp_operation_Pipeline_s_operation_data_op_fu_51 : component alv_MIMD_operation_Pipeline_s_operation_data_op
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start,
        ap_done => grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done,
        ap_idle => grp_operation_Pipeline_s_operation_data_op_fu_51_ap_idle,
        ap_ready => grp_operation_Pipeline_s_operation_data_op_fu_51_ap_ready,
        ALU_operation_dout => ALU_operation_dout,
        ALU_operation_empty_n => ALU_operation_empty_n,
        ALU_operation_read => grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_read,
        ALU_operation_MEM_address0 => grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_address0,
        ALU_operation_MEM_ce0 => grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_ce0,
        ALU_operation_MEM_we0 => grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_we0,
        ALU_operation_MEM_d0 => grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_d0);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_operation_Pipeline_l_operation_fu_42_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_operation_Pipeline_l_operation_fu_42_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    grp_operation_Pipeline_l_operation_fu_42_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_operation_Pipeline_l_operation_fu_42_ap_ready = ap_const_logic_1)) then 
                    grp_operation_Pipeline_l_operation_fu_42_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_operation_Pipeline_s_operation_data_op_fu_51_ap_ready = ap_const_logic_1)) then 
                    grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_operation_Pipeline_l_operation_fu_42_ap_done, grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done, ap_CS_fsm_state3, ap_CS_fsm_state6)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (grp_operation_Pipeline_l_operation_fu_42_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    ALU_operation_MEM_address0 <= grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_address0;
    ALU_operation_MEM_ce0 <= grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_ce0;
    ALU_operation_MEM_d0 <= grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_d0;
    ALU_operation_MEM_we0 <= grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_MEM_we0;
    ALU_operation_din <= grp_operation_Pipeline_l_operation_fu_42_ALU_operation_din;

    ALU_operation_read_assign_proc : process(grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_read, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ALU_operation_read <= grp_operation_Pipeline_s_operation_data_op_fu_51_ALU_operation_read;
        else 
            ALU_operation_read <= ap_const_logic_0;
        end if; 
    end process;


    ALU_operation_write_assign_proc : process(grp_operation_Pipeline_l_operation_fu_42_ALU_operation_write, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ALU_operation_write <= grp_operation_Pipeline_l_operation_fu_42_ALU_operation_write;
        else 
            ALU_operation_write <= ap_const_logic_0;
        end if; 
    end process;

    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_operation_Pipeline_l_operation_fu_42_ap_done)
    begin
        if ((grp_operation_Pipeline_l_operation_fu_42_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done)
    begin
        if ((grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done, ap_CS_fsm_state6)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)) or ((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done = ap_const_logic_1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_operation_Pipeline_s_operation_data_op_fu_51_ap_done = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_operation_Pipeline_l_operation_fu_42_ap_start <= grp_operation_Pipeline_l_operation_fu_42_ap_start_reg;
    grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start <= grp_operation_Pipeline_s_operation_data_op_fu_51_ap_start_reg;
    m_axi_gmem3_ARADDR <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARADDR;
    m_axi_gmem3_ARBURST <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARBURST;
    m_axi_gmem3_ARCACHE <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARCACHE;
    m_axi_gmem3_ARID <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARID;
    m_axi_gmem3_ARLEN <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARLEN;
    m_axi_gmem3_ARLOCK <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARLOCK;
    m_axi_gmem3_ARPROT <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARPROT;
    m_axi_gmem3_ARQOS <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARQOS;
    m_axi_gmem3_ARREGION <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARREGION;
    m_axi_gmem3_ARSIZE <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARSIZE;
    m_axi_gmem3_ARUSER <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARUSER;

    m_axi_gmem3_ARVALID_assign_proc : process(grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARVALID, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem3_ARVALID <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_ARVALID;
        else 
            m_axi_gmem3_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem3_AWADDR <= ap_const_lv64_0;
    m_axi_gmem3_AWBURST <= ap_const_lv2_0;
    m_axi_gmem3_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem3_AWID <= ap_const_lv1_0;
    m_axi_gmem3_AWLEN <= ap_const_lv32_0;
    m_axi_gmem3_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem3_AWPROT <= ap_const_lv3_0;
    m_axi_gmem3_AWQOS <= ap_const_lv4_0;
    m_axi_gmem3_AWREGION <= ap_const_lv4_0;
    m_axi_gmem3_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem3_AWUSER <= ap_const_lv1_0;
    m_axi_gmem3_AWVALID <= ap_const_logic_0;
    m_axi_gmem3_BREADY <= ap_const_logic_0;

    m_axi_gmem3_RREADY_assign_proc : process(grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_RREADY, ap_CS_fsm_state2, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            m_axi_gmem3_RREADY <= grp_operation_Pipeline_l_operation_fu_42_m_axi_gmem3_RREADY;
        else 
            m_axi_gmem3_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem3_WDATA <= ap_const_lv32_0;
    m_axi_gmem3_WID <= ap_const_lv1_0;
    m_axi_gmem3_WLAST <= ap_const_logic_0;
    m_axi_gmem3_WSTRB <= ap_const_lv4_0;
    m_axi_gmem3_WUSER <= ap_const_lv1_0;
    m_axi_gmem3_WVALID <= ap_const_logic_0;
end behav;
