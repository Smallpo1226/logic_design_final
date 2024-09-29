`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 17:14:15
// Design Name: 
// Module Name: picture_loc
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
`define TA_hei 10'd16
`define TA_wid 10'd16
`define bottom 10'd420
`define TA_INITAIL_LOC 10'd200
`define zero 0
`define one 1
`define jump_time 10'd40 //0.4sec
`define left_border 10'd32
`define up_border 20
//test

module TA_loc(
    input clk,
    input rst,
    input jump,
    output reg[9:0] TA_h,
    output reg[9:0] TA_v,
    output reg [9:0] TA_height,
    output reg [9:0] TA_width
    );
    reg [9:0] next_position;
    reg stable;
    reg [9:0]counter,next_counter;
     always @*
        if (TA_v == `bottom && jump!=`one)
                next_position = TA_v ;
        else if (TA_v < `bottom+`one && jump!=`one)
              next_position = TA_v + `one; 
        else if(jump==`one) begin
          if(TA_v == `up_border)
              next_position = TA_v ;
          else 
              next_position = TA_v - `one;
           end
        else
           next_position = `bottom;
      always @(posedge clk or posedge rst)  
        if (rst) begin
          counter<=10'd`zero;
          TA_v <= `TA_INITAIL_LOC;
          TA_h <= `left_border;
          TA_height<= `TA_hei;
          TA_width<= `TA_wid;
          end
         
        else begin
          TA_v <= next_position;
          counter<=next_counter;
          end
          
          
    endmodule