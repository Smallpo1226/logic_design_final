`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 18:15:36
// Design Name: 
// Module Name: one_pulse
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


module one_pulse(
    input in_trig,
    input clk,
    input rst_n,
    output reg one_pulse
    );
    wire pulse_tmp;
    reg in_trig_delay;

// buffer input
always@(posedge clk or negedge rst_n)
    if (~rst_n)
        in_trig_delay <= 1'b0;
    else
        in_trig_delay <= in_trig;
    
// pulse generation
assign pulse_tmp = in_trig&(~in_trig_delay);

always@(posedge clk or negedge rst_n)
    if (~rst_n)
        one_pulse <= 1'b0;
    else
        one_pulse <= pulse_tmp;

endmodule