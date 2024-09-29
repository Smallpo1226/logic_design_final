`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/03 15:03:37
// Design Name: 
// Module Name: tube_loc
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
`define TUBE_0_W 60
`define TUBE_0_H 120
`define TUBE_1_W 60
`define TUBE_1_H 180
`define TUBE_2_W 60
`define TUBE_2_H 240
`define TUBE_3_W 60
`define TUBE_3_H 300
`define TUBE_INIT_V_0 360
`define TUBE_INIT_V_1 300
`define TUBE_INIT_V_2 240
`define TUBE_INIT_V_3 180

`define TUBE_0_W_U 60
`define TUBE_0_H_U 240
`define TUBE_1_W_U 60
`define TUBE_1_H_U 180
`define TUBE_2_W_U 60
`define TUBE_2_H_U 120
`define TUBE_3_W_U 60
`define TUBE_3_H_U 60
`define TUBE_INIT_V_0_U 0
`define TUBE_INIT_V_1_U 0
`define TUBE_INIT_V_2_U 0
`define TUBE_INIT_V_3_U 0

module tube_loc(
    input clk,
    input rst,
    input[9:0] initial_h,
    input [2:0] tube_state,
    input updown,
    output reg [9:0] tube_h,//?��?��水平位置
    output reg [9:0] tube_v,//?��?��??�直位置
    output reg [9:0] tube_height,
    output reg [9:0] tube_width
    );

    reg [9:0] tube_h_tmp;
    reg [9:0] tube_v_tmp;
    reg [9:0] initial_v;
    always@*
        case (tube_state[2:1])
            2'd0: begin
                if(updown) begin
                    tube_height = `TUBE_0_H;
                    tube_width = `TUBE_0_W;  
                    initial_v = `TUBE_INIT_V_0;
                end
                else begin
                    tube_height = `TUBE_0_H_U;
                    tube_width = `TUBE_0_W_U;  
                    initial_v = `TUBE_INIT_V_0_U;
                end
            end
            2'd1: begin
                if(updown) begin
                    tube_height = `TUBE_1_H;
                    tube_width = `TUBE_1_W;  
                    initial_v = `TUBE_INIT_V_1;
                end
                else begin
                    tube_height = `TUBE_1_H_U;
                    tube_width = `TUBE_1_W_U;  
                    initial_v = `TUBE_INIT_V_1_U;
                end
            end
            2'd2: begin
                if(updown) begin
                    tube_height = `TUBE_2_H;
                    tube_width = `TUBE_2_W;  
                    initial_v = `TUBE_INIT_V_2;
                end
                else begin
                    tube_height = `TUBE_2_H_U;
                    tube_width = `TUBE_2_W_U;  
                    initial_v = `TUBE_INIT_V_2_U;
                end
            end
            2'd3: begin
                if(updown) begin
                    tube_height = `TUBE_3_H;
                    tube_width = `TUBE_3_W;  
                    initial_v = `TUBE_INIT_V_3;
                end
                else begin
                    tube_height = `TUBE_3_H_U;
                    tube_width = `TUBE_3_W_U;  
                    initial_v = `TUBE_INIT_V_3_U;
                end
            end
            default: begin
                if(updown) begin
                    tube_height = `TUBE_0_H;
                    tube_width = `TUBE_0_W;  
                    initial_v = `TUBE_INIT_V_0;
                end
                else begin
                    tube_height = `TUBE_0_H_U;
                    tube_width = `TUBE_0_W_U;  
                    initial_v = `TUBE_INIT_V_0_U;
                end
            end
        endcase

    always@*
        if(tube_h>0)
            tube_h_tmp = tube_h - 1;
        else if (tube_h > 849)
            tube_h_tmp = 849;
        else 
            tube_h_tmp = 849;
    // flip flop     
    always@(posedge clk or posedge rst)
       if(rst) begin
           tube_h <= initial_h;
           tube_v <= initial_v;
       end
       else begin
           tube_h <= tube_h_tmp;
           tube_v <= initial_v;
       end
endmodule
