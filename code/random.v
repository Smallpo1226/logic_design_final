`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/04 03:42:16
// Design Name: 
// Module Name: random
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


module random(
        init,
        state,
        position,
        limit,
        rst,
        clk
    );
    output reg [2:0] state;
    input [2:0] init;
    input [9:0] position;
    input rst;
    input [9:0] limit;
    input clk; 

    wire state_tmp;
    reg internal_clk;
    reg [2:0] n_state;

    // always@* 
    //     if(position == 9'd0)
    //         internal_clk = 1'b1;
    //     else
    //         internal_clk = 1'b0;

    assign state_tmp = state[2] ^ state[1];

    always@*
        if(position == limit)begin
            n_state[2] = state[1];
            n_state[1] = state[0];
            n_state[0] = state_tmp;
        end
        else
            n_state = state;
    
    always @(posedge clk or posedge rst)
        if (rst)
            begin
                state[2] <= init[2];
                state[1] <= init[1];
                state[0] <= init[0];        
            end
        else
            begin
                state[2] <= n_state[2];
                state[1] <= n_state[1];
                state[0] <= n_state[0];
            end
    
endmodule
