//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Thu Aug 29 13:48:15 2024
//Host        : MSI running 64-bit major release  (build 9200)
//Command     : generate_target arbiter2enable_wrapper.bd
//Design      : arbiter2enable_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module arbiter2enable_wrapper
   (busy,
    din,
    dout,
    frame_n,
    frame_o,
    request,
    reset_n,
    valid_n,
    valid_o);
  output busy;
  input [15:0]din;
  output dout;
  input [15:0]frame_n;
  output frame_o;
  input [15:0]request;
  input reset_n;
  input [15:0]valid_n;
  output valid_o;

  wire busy;
  wire [15:0]din;
  wire dout;
  wire [15:0]frame_n;
  wire frame_o;
  wire [15:0]request;
  wire reset_n;
  wire [15:0]valid_n;
  wire valid_o;

  arbiter2enable arbiter2enable_i
       (.busy(busy),
        .din(din),
        .dout(dout),
        .frame_n(frame_n),
        .frame_o(frame_o),
        .request(request),
        .reset_n(reset_n),
        .valid_n(valid_n),
        .valid_o(valid_o));
endmodule
