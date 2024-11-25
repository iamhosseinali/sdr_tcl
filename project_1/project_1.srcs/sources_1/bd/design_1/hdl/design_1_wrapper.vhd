--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
--Date        : Mon Nov 25 15:17:27 2024
--Host        : DESKTOP-BHTQP5B running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    enable : out STD_LOGIC;
    gpio_i : in STD_LOGIC_VECTOR ( 63 downto 0 );
    gpio_o : out STD_LOGIC_VECTOR ( 63 downto 0 );
    gpio_t : out STD_LOGIC_VECTOR ( 63 downto 0 );
    otg_vbusoc : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx_clk_in_n : in STD_LOGIC;
    rx_clk_in_p : in STD_LOGIC;
    rx_data_in_n : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rx_data_in_p : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rx_frame_in_n : in STD_LOGIC;
    rx_frame_in_p : in STD_LOGIC;
    spi0_clk_i : in STD_LOGIC;
    spi0_clk_o : out STD_LOGIC;
    spi0_csn_0_o : out STD_LOGIC;
    spi0_csn_1_o : out STD_LOGIC;
    spi0_csn_2_o : out STD_LOGIC;
    spi0_csn_i : in STD_LOGIC;
    spi0_sdi_i : in STD_LOGIC;
    spi0_sdo_i : in STD_LOGIC;
    spi0_sdo_o : out STD_LOGIC;
    tdd_sync_i : in STD_LOGIC;
    tdd_sync_o : out STD_LOGIC;
    tdd_sync_t : out STD_LOGIC;
    tx_clk_out_n : out STD_LOGIC;
    tx_clk_out_p : out STD_LOGIC;
    tx_data_out_n : out STD_LOGIC_VECTOR ( 5 downto 0 );
    tx_data_out_p : out STD_LOGIC_VECTOR ( 5 downto 0 );
    tx_frame_out_n : out STD_LOGIC;
    tx_frame_out_p : out STD_LOGIC;
    txnrx : out STD_LOGIC;
    up_enable : in STD_LOGIC;
    up_txnrx : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    gpio_i : in STD_LOGIC_VECTOR ( 63 downto 0 );
    spi0_sdi_i : in STD_LOGIC;
    spi0_sdo_i : in STD_LOGIC;
    spi0_clk_i : in STD_LOGIC;
    spi0_csn_i : in STD_LOGIC;
    tdd_sync_t : out STD_LOGIC;
    enable : out STD_LOGIC;
    tx_clk_out_n : out STD_LOGIC;
    tx_clk_out_p : out STD_LOGIC;
    tx_data_out_n : out STD_LOGIC_VECTOR ( 5 downto 0 );
    tx_data_out_p : out STD_LOGIC_VECTOR ( 5 downto 0 );
    tx_frame_out_n : out STD_LOGIC;
    tx_frame_out_p : out STD_LOGIC;
    txnrx : out STD_LOGIC;
    gpio_o : out STD_LOGIC_VECTOR ( 63 downto 0 );
    gpio_t : out STD_LOGIC_VECTOR ( 63 downto 0 );
    spi0_sdo_o : out STD_LOGIC;
    spi0_clk_o : out STD_LOGIC;
    spi0_csn_1_o : out STD_LOGIC;
    spi0_csn_2_o : out STD_LOGIC;
    spi0_csn_0_o : out STD_LOGIC;
    rx_clk_in_n : in STD_LOGIC;
    rx_clk_in_p : in STD_LOGIC;
    rx_data_in_n : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rx_data_in_p : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rx_frame_in_n : in STD_LOGIC;
    rx_frame_in_p : in STD_LOGIC;
    tdd_sync_i : in STD_LOGIC;
    up_enable : in STD_LOGIC;
    up_txnrx : in STD_LOGIC;
    tdd_sync_o : out STD_LOGIC;
    otg_vbusoc : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      enable => enable,
      gpio_i(63 downto 0) => gpio_i(63 downto 0),
      gpio_o(63 downto 0) => gpio_o(63 downto 0),
      gpio_t(63 downto 0) => gpio_t(63 downto 0),
      otg_vbusoc(0) => otg_vbusoc(0),
      rx_clk_in_n => rx_clk_in_n,
      rx_clk_in_p => rx_clk_in_p,
      rx_data_in_n(5 downto 0) => rx_data_in_n(5 downto 0),
      rx_data_in_p(5 downto 0) => rx_data_in_p(5 downto 0),
      rx_frame_in_n => rx_frame_in_n,
      rx_frame_in_p => rx_frame_in_p,
      spi0_clk_i => spi0_clk_i,
      spi0_clk_o => spi0_clk_o,
      spi0_csn_0_o => spi0_csn_0_o,
      spi0_csn_1_o => spi0_csn_1_o,
      spi0_csn_2_o => spi0_csn_2_o,
      spi0_csn_i => spi0_csn_i,
      spi0_sdi_i => spi0_sdi_i,
      spi0_sdo_i => spi0_sdo_i,
      spi0_sdo_o => spi0_sdo_o,
      tdd_sync_i => tdd_sync_i,
      tdd_sync_o => tdd_sync_o,
      tdd_sync_t => tdd_sync_t,
      tx_clk_out_n => tx_clk_out_n,
      tx_clk_out_p => tx_clk_out_p,
      tx_data_out_n(5 downto 0) => tx_data_out_n(5 downto 0),
      tx_data_out_p(5 downto 0) => tx_data_out_p(5 downto 0),
      tx_frame_out_n => tx_frame_out_n,
      tx_frame_out_p => tx_frame_out_p,
      txnrx => txnrx,
      up_enable => up_enable,
      up_txnrx => up_txnrx
    );
end STRUCTURE;
