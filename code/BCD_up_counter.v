`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/01 15:16:03
// Design Name: 
// Module Name: BCD_up_cnt
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
`define ENABLED  1'b1
`define DISABLED 1'b0

module BCD_up_cnt(
    input clk,
    input rst_n,
    input increase,
    input [3:0]limit,
    output reg [3:0]value,
    output reg carry
    );
    reg [3:0]value_tmp;

always@*
    if (value == limit && increase)
        begin
            value_tmp = 0;
            carry = `ENABLED;
        end
    else if (value != limit && increase)
        begin
            value_tmp = value + 1;
            carry = `DISABLED;
        end
    else
        begin
            value_tmp = value;
            carry = `DISABLED;
        end

always@(posedge clk or negedge rst_n)
    if (~rst_n)
        begin
            value <= 0;
        end
    else
        begin
            value <= value_tmp;
        end

endmodule
