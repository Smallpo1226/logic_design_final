`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/07 03:56:52
// Design Name: 
// Module Name: mem_gen_U
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


module mem_gen_U(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [9:0] loc_h,
    input [9:0] loc_v,
    input [9:0] height,
    input [9:0] width,
    // input [16:0] mod,
    output reg [16:0] pixel_addr
);
    

  always @* begin
    if ((h_cnt>=loc_h) && (h_cnt<(loc_h+width)))begin
        if((v_cnt>=loc_v) && (v_cnt<(loc_v+height)))begin
            // pixel_addr = ((h_cnt-loc_h) + width * (v_cnt - loc_v)) % mod;
            pixel_addr = ((h_cnt-loc_h) + width * (v_cnt - loc_v+450-height))%(27000) ;
        end
        else
            pixel_addr = 0;
    end
    else if((loc_h>849-width) && (h_cnt<(width-(849-loc_h))+1))begin
        if((v_cnt>=loc_v) && (v_cnt<(loc_v+height)))begin
            // pixel_addr = ((h_cnt-loc_h+850) + width * (v_cnt - loc_v)) % mod;
            pixel_addr = ((h_cnt-loc_h+850) + width * (v_cnt - loc_v+450-height))%(27000);
        end
        else
            pixel_addr = 0;
    end
    else
        pixel_addr = 0;
        // pixel_addr = ((h_cnt-loc_h) + width * (v_cnt - loc_v))%27000 ;
  end



endmodule
