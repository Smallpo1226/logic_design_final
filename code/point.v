`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/15 15:35:11
// Design Name: 
// Module Name: point
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


module point(
    input rst,
    input touch,
    input clk,
    input [1:0] ssd_ctl_en,
    output [7:0]segs,
    output [3:0]ssd_ctl
    );
    wire clk_1Hz, clk_100kHz, clk_1MHz,clk_10Hz,clk_100Hz;
    wire clk_out;
    wire [3:0] value_forth, value_third, value_second, value_first;
    wire carry4, carry3, carry2, carry1, carry0;
    wire [3:0]ssd_in;
    
        BCD_up_cnt Ufirst0(
        .clk(clk),
        .rst_n(rst),
        .increase(touch),
        .limit(4'd9),
        .value(value_first),
        .carry(carry0)
    );

    BCD_up_cnt Usecond1(
        .clk(clk),
        .rst_n(rst),
        .increase(carry0),
        .limit(4'd9),
        .value(value_second),
        .carry(carry1)
    );

    BCD_up_cnt Uthird0(
        .clk(clk),
        .rst_n(rst),
        .increase(carry0 & carry1),
        .limit(4'd9),
        .value(value_third),
        .carry(carry2)
    );

    BCD_up_cnt Uforth1(
        .clk(clk),
        .rst_n(rst),
        .increase(carry0 & carry1 & carry2),
        .limit(4'd9),
        .value(value_forth),
        .carry(carry3)
    );
    
    scan_ctl U7(
            .ssd_ctl_en(ssd_ctl_en),
            .in3(value_forth),
            .in2(value_third),
            .in1(value_second),
            .in0(value_first),
            .ssd_ctl(ssd_ctl),
            .ssd_in(ssd_in)
        );
        
        display U8(
            .in(ssd_in),
            .segs(segs)
        );
endmodule
