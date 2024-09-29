`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 17:07:40
// Design Name: 
// Module Name: collision
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


module collision(
    input  tub_exist_0_U,
    input  tub_exist_1_U,
    input  tub_exist_2_U,
    input  tub_exist_3_U,
    input  tub_exist_0,
    input  tub_exist_1,
    input  tub_exist_2,
    input  tub_exist_3,
    input  star_exist_0,
    input  star_exist_1,
    input  star_exist_2,
    input  star_exist_3,
    input  TA_exist,
    output collision_tube,
    output collision_star
);
    assign collision_tube = (tub_exist_0_U | tub_exist_1_U | tub_exist_2_U | tub_exist_3_U | tub_exist_0 | tub_exist_1 | tub_exist_2 | tub_exist_3) && TA_exist;
    assign collision_star = (star_exist_0 | star_exist_1 | star_exist_2 | star_exist_3) && TA_exist;

  
endmodule
