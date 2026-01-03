// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Mon Nov 24 11:06:04 2025
// Host        : 25STC151L17 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/ian2112/final_lab/final_lab.gen/sources_1/ip/BITMAP_ROM/BITMAP_ROM_sim_netlist.v
// Design      : BITMAP_ROM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "BITMAP_ROM,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module BITMAP_ROM
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [127:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [127:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [127:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [127:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     12.7408 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "BITMAP_ROM.mem" *) 
  (* C_INIT_FILE_NAME = "BITMAP_ROM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "128" *) 
  (* C_READ_WIDTH_B = "128" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "128" *) 
  (* C_WRITE_WIDTH_B = "128" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  BITMAP_ROM_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[127:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[127:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51472)
`pragma protect data_block
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
Gg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
