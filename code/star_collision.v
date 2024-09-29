`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/15 22:35:34
// Design Name: 
// Module Name: star_collision
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


module star_collision(
    input [9:0] TA_h, TA_v,
    input [9:0] TA_height, TA_width,
    input [9:0] star_h_0, star_h_1, star_h_2, star_h_3,
    input [9:0] star_v_0, star_v_1, star_v_2, star_v_3,
    input [9:0] star_height_0, star_height_1, star_height_2, star_height_3,
    input [9:0] star_width_0, star_width_1, star_width_2, star_width_3,
    output reg star_collision
    );
    
    always @(*) begin
        if((TA_h<star_h_0+star_width_0)&&(TA_h+TA_width>star_h_0))
            if((TA_v<star_v_0+star_height_0)&&(TA_v+TA_height>star_v_0))
                star_collision = 1;
            else
                star_collision = 0;
        else if ((TA_h<star_h_1+star_width_1)&&(TA_h+TA_width>star_h_1))
            if((TA_v<star_v_1+star_height_1)&&(TA_v+TA_height>star_v_1))
                star_collision = 1;
            else
                star_collision = 0;
        else if ((TA_h<star_h_2+star_width_2)&&(TA_h+TA_width>star_h_2))
            if((TA_v<star_v_2+star_height_2)&&(TA_v+TA_height>star_v_2))
                star_collision = 1;
            else
                star_collision = 0;
        else if ((TA_h<star_h_3+star_width_3)&&(TA_h+TA_width>star_h_3))
            if((TA_v<star_v_3+star_height_3)&&(TA_v+TA_height>star_v_3))
                star_collision = 1;
            else
                star_collision = 0;
        else
            star_collision = 0;

    end
endmodule
