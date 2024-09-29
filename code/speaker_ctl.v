`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 19:03:20
// Design Name: 
// Module Name: speaker_ctl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module speaker_ctl(
    input clk,
    input rst_n,
    input [15:0]audio_left,
    input [15:0]audio_right,
    output reg audio_mclk,  // main clock(25MHz = 100MHz/4)
    output reg audio_lrck,  // sample rate clock of  parallel input audio(25MHz/128 = 100MHz/512)
    output reg audio_sck,   // serial clock(25MHz/4 = 100MHz/16)
    output reg audio_sdin   // 1 bit audio data output
    );
    reg cnt_mclk;
    reg [7:0]cnt_lrck;
    reg [2:0]cnt_sck;
    reg [1:0]cnt_mclk_tmp;
    reg [8:0]cnt_lrck_tmp;
    reg [3:0]cnt_sck_tmp;
    reg [31:0]audio_input_tmp;
    reg [4:0]cnt, cnt_tmp;  // for mux
    reg audio_sdin_tmp;
    reg audio_sdin_delay;

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            {audio_mclk,cnt_mclk} <= 0;
            {audio_lrck,cnt_lrck} <= 0;
            {audio_sck,cnt_sck} <= 0;
        end
    else
        begin
            {audio_mclk,cnt_mclk} <= cnt_mclk_tmp;
            {audio_lrck,cnt_lrck} <= cnt_lrck_tmp;
            {audio_sck,cnt_sck} <= cnt_sck_tmp;
        end

// for generating 25MHz(100MHz/4) main clock
always@*
    cnt_mclk_tmp = {audio_mclk,cnt_mclk} + 1;

// for generating 25MHz/128(100MHz/512) sample rate clock
always@*
    cnt_lrck_tmp = {audio_lrck,cnt_lrck} + 1;

// for generating 25MHz/4(100MHz/16) serial clock
always@*
    cnt_sck_tmp = {audio_sck,cnt_sck} + 1;

//  parallel to serial
always@(posedge audio_lrck or negedge rst_n)
    if(~rst_n)
        begin
            audio_input_tmp <= 0;
        end
    else
        begin
            audio_input_tmp <= {audio_left,audio_right};
        end

always@*
    cnt_tmp = cnt + 1;

always@*
    case (cnt)
        5'd0: audio_sdin_tmp = audio_input_tmp[31];
        5'd1: audio_sdin_tmp = audio_input_tmp[30];
        5'd2: audio_sdin_tmp = audio_input_tmp[29];
        5'd3: audio_sdin_tmp = audio_input_tmp[28];
        5'd4: audio_sdin_tmp = audio_input_tmp[27];
        5'd5: audio_sdin_tmp = audio_input_tmp[26];
        5'd6: audio_sdin_tmp = audio_input_tmp[25];
        5'd7: audio_sdin_tmp = audio_input_tmp[24];
        5'd8: audio_sdin_tmp = audio_input_tmp[23];
        5'd9: audio_sdin_tmp = audio_input_tmp[22];
        5'd10: audio_sdin_tmp = audio_input_tmp[21];
        5'd11: audio_sdin_tmp = audio_input_tmp[20];
        5'd12: audio_sdin_tmp = audio_input_tmp[19];
        5'd13: audio_sdin_tmp = audio_input_tmp[18];
        5'd14: audio_sdin_tmp = audio_input_tmp[17];
        5'd15: audio_sdin_tmp = audio_input_tmp[16];
        5'd16: audio_sdin_tmp = audio_input_tmp[15];
        5'd17: audio_sdin_tmp = audio_input_tmp[14];
        5'd18: audio_sdin_tmp = audio_input_tmp[13];
        5'd19: audio_sdin_tmp = audio_input_tmp[12];
        5'd20: audio_sdin_tmp = audio_input_tmp[11];
        5'd21: audio_sdin_tmp = audio_input_tmp[10];
        5'd22: audio_sdin_tmp = audio_input_tmp[9];
        5'd23: audio_sdin_tmp = audio_input_tmp[8];
        5'd24: audio_sdin_tmp = audio_input_tmp[7];
        5'd25: audio_sdin_tmp = audio_input_tmp[6];
        5'd26: audio_sdin_tmp = audio_input_tmp[5];
        5'd27: audio_sdin_tmp = audio_input_tmp[4];
        5'd28: audio_sdin_tmp = audio_input_tmp[3];
        5'd29: audio_sdin_tmp = audio_input_tmp[2];
        5'd30: audio_sdin_tmp = audio_input_tmp[1];
        5'd31: audio_sdin_tmp = audio_input_tmp[0];
        default: audio_sdin_tmp = 0;
    endcase

// one sck delay and then output
always@(posedge audio_sck or negedge rst_n)
    if(~rst_n)
        begin
            cnt <= 5'd0;
            audio_sdin_delay <= 0;
            audio_sdin <= 0;
        end
    else
        begin
            cnt <= cnt_tmp;
            audio_sdin_delay <= audio_sdin_tmp;
            audio_sdin <= audio_sdin_delay;
        end

endmodule