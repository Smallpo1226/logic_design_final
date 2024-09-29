`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 18:14:59
// Design Name: 
// Module Name: debounce
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


module debounce(
    input pb_in, // push bottom input
    input clk, // 100Hz clock
    input rst_n, 
    output reg pb_debounced // debounced signal
    );
    reg pb_tmp; //  debounced result
    reg [3:0]i; // shift register flip flop
    
// shifter register
always@(posedge clk or negedge rst_n)
    if (~rst_n)
        i <= 4'd0;
    else
        i <= {i[2:0],pb_in};
    
// debounce circuit
always @*
    if (i == 4'b1111)
        pb_tmp = 1'b1;
    else
        pb_tmp = 1'b0;
        
always@(posedge clk or negedge rst_n)
    if (~rst_n)
        pb_debounced <= 1'b0;
    else
        pb_debounced <= pb_tmp;

endmodule