`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/15 14:03:14
// Design Name: 
// Module Name: star_loc
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
`define STAR_U_W 30 //up
`define STAR_U_H 30
`define STAR_D_W 30 //down
`define STAR_D_H 30
`define STAR_H_W 30 //hide
`define STAR_H_H 30

`define STAR_U_INIT_V 60
`define STAR_D_INIT_V 300
`define STAR_H_INIT_V 500

module star_loc(
    input clk,
    input rst,
    input[9:0] initial_h,
    input [2:0] star_state,
    output reg [9:0] star_h,
    output reg [9:0] star_v,
    output reg [9:0] star_height,
    output reg [9:0] star_width
    );
    reg [9:0] star_h_tmp;
    reg [9:0] star_v_tmp;
    reg [9:0] initial_v;
    always@*
        case (star_state)
            3'd1: begin     //up
                star_height = `STAR_U_H;
                star_width = `STAR_U_W;  
                initial_v = `STAR_U_INIT_V;
            end
            3'd2: begin     //down
                star_height = `STAR_D_H;
                star_width = `STAR_D_W;  
                initial_v = `STAR_D_INIT_V;
            end
            3'd5: begin     //down
                star_height = `STAR_D_H;
                star_width = `STAR_D_W;  
                initial_v = `STAR_D_INIT_V;
            end
            3'd6: begin     //up
                star_height = `STAR_U_H;
                star_width = `STAR_U_W;  
                initial_v = `STAR_U_INIT_V;
            end
            default: begin     //hide
                star_height = `STAR_H_H;
                star_width = `STAR_H_W;  
                initial_v = `STAR_H_INIT_V;
            end
        endcase

    always@*
        if(star_h>0)
            star_h_tmp = star_h - 1;
        else if (star_h > 849)
            star_h_tmp = 849;
        else 
            star_h_tmp = 849;
    // flip flop     
    always@(posedge clk or posedge rst)
       if(rst) begin
           star_h <= initial_h;
           star_v <= initial_v;
       end
       else begin
           star_h <= star_h_tmp;
           star_v <= initial_v;
       end
endmodule