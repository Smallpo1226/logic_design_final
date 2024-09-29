`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/03 17:22:06
// Design Name: 
// Module Name: vga_show
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


module vga_showmodule (
  input tub_exist_0, tub_exist_1, tub_exist_2, tub_exist_3, tub_exist_0_U, tub_exist_1_U, tub_exist_2_U, tub_exist_3_U, TA_exist,
  input star_exist_0, star_exist_1, star_exist_2, star_exist_3,
  input [11:0] pixel_tube, pixel_start, pixel_tube_U, pixel_star, pixel_panda,
  input valid,
  input [1:0] state,
  output reg [3:0] vgaRed,
  output reg [3:0] vgaGreen,
  output reg [3:0] vgaBlue
);
  
always @(*)
begin
if(state == 2'd1 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h0F0;
    {vgaRed, vgaGreen, vgaBlue} = pixel_start;
else if (state == 2'd3&&valid) 
    {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    // {vgaRed, vgaGreen, vgaBlue} = pixel_start;
else if (tub_exist_0 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h0F0;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube;
else if (tub_exist_1 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'hF00;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube;
else if (tub_exist_2 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h00F;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube;
else if (tub_exist_3 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h00F;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube;
else if (tub_exist_0_U && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h0F0;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube_U;
else if (tub_exist_1_U && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'hF00;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube_U;
else if (tub_exist_2_U && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h00F;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube_U;
else if (tub_exist_3_U && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h00F;
    {vgaRed, vgaGreen, vgaBlue} = pixel_tube_U;
else if (TA_exist && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h00F;
    {vgaRed, vgaGreen, vgaBlue} = pixel_panda;
else if (star_exist_0 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h0F0;
    {vgaRed, vgaGreen, vgaBlue} = pixel_star;
else if (star_exist_1 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'hF00;
    {vgaRed, vgaGreen, vgaBlue} = pixel_star;
else if (star_exist_2 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h00F;
    {vgaRed, vgaGreen, vgaBlue} = pixel_star;
else if (star_exist_3 && valid)
    // {vgaRed, vgaGreen, vgaBlue} = 12'h00F;
    {vgaRed, vgaGreen, vgaBlue} = pixel_star;
else if (valid)
    {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    // {vgaRed, vgaGreen, vgaBlue} = pixel_start;
else
    {vgaRed, vgaGreen, vgaBlue} = 12'h000;
end


  
endmodule

