`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/01 15:15:11
// Design Name: 
// Module Name: freq_div
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

module freq_div(
    input clk,
    input rst_n,
    output reg [1:0]clk_ctl,
    output reg clk_1Hz,
    output reg clk_100kHz,
    output reg clk_1MHz,
    output reg clk_100Hz,
    output reg clk_10Hz
    );
    reg [25:0]cnt_tmp1, cnt_tmp2, cnt_tmp3,cnt_tmp4,cnt_tmp5;
    reg [8:0]cnt_h;
    reg [14:0]cnt_l;
    reg clk_tmp1, clk_tmp2, clk_tmp3,clk_tmp4,clk_tmp5;
    reg [25:0]cnt_100k, cnt_1M,cnt_100,cnt_10;
    
// for generating 1Hz frequency
always@*
    if({cnt_h,clk_ctl,cnt_l} == 26'd50000000)
        begin
            cnt_tmp1 = 26'b0;
            clk_tmp1 = ~clk_1Hz;
        end
    else
        begin
            cnt_tmp1 = {cnt_h,clk_ctl,cnt_l} + 1;
            clk_tmp1 = clk_1Hz;
        end


always@*
    if(cnt_100 == 26'd500000)
        begin
            cnt_tmp4 = 26'b0;
            clk_tmp4 = ~clk_100Hz;
        end
    else
        begin
            cnt_tmp4 = cnt_100 + 1;
            clk_tmp4 = clk_100Hz;
        end
always@*
            if(cnt_10 == 26'd5000000)
                begin
                    cnt_tmp5 = 26'b0;
                    clk_tmp5 = ~clk_10Hz;
                end
            else
                begin
                    cnt_tmp5 = cnt_10 + 1;
                    clk_tmp5 = clk_10Hz;
                end
// for generating 100kHz frequency
always@*
    if(cnt_100k == 26'd500)
        begin
            cnt_tmp2 = 26'b0;
            clk_tmp2 = ~clk_100kHz;
        end
    else
        begin
            cnt_tmp2 = cnt_100k + 1;
            clk_tmp2 = clk_100kHz;
        end

// for generating 1MHz frequency
always@*
    if(cnt_1M == 26'd50)
        begin
            cnt_tmp3 = 26'b0;
            clk_tmp3 = ~clk_1MHz;
        end
    else
        begin
            cnt_tmp3 = cnt_1M + 1;
            clk_tmp3 = clk_1MHz;
        end

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            {cnt_h,clk_ctl,cnt_l} <= 26'b0;
            cnt_100k <= 26'b0;
            cnt_1M <= 26'b0;
            cnt_100<= 26'b0;
            cnt_10<=26'b0;
            clk_1Hz <= 1'b0;
            clk_100kHz <= 1'b0;
            clk_1MHz <= 1'b0;
            clk_100Hz<=1'b0;
            clk_10Hz<=1'b0;
        end
    else
        begin
            {cnt_h,clk_ctl,cnt_l} <= cnt_tmp1;
            cnt_100k <= cnt_tmp2;
            cnt_1M <= cnt_tmp3;
            cnt_100<= cnt_tmp4;
            cnt_10<=cnt_tmp5;
            clk_1Hz <= clk_tmp1;
            clk_100kHz <= clk_tmp2;
            clk_1MHz <= clk_tmp3;
            clk_100Hz<=clk_tmp4;
            clk_10Hz<=clk_tmp5;
        end

endmodule
