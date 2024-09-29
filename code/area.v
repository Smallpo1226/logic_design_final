`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/03 17:22:06
// Design Name: 
// Module Name: area
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


module area(
    input clk,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [19:0] tub_loc_0, tub_loc_1, tub_loc_2, tub_loc_3,
    input [19:0] tub_size_0, tub_size_1, tub_size_2, tub_size_3,
    input [19:0] tub_loc_0_U, tub_loc_1_U, tub_loc_2_U, tub_loc_3_U,
    input [19:0] tub_size_0_U, tub_size_1_U, tub_size_2_U, tub_size_3_U,
    input [19:0] star_loc_0, star_loc_1, star_loc_2, star_loc_3,
    input [19:0] star_size_0, star_size_1, star_size_2, star_size_3,
    input [19:0] TA_loc,
    input [19:0] TA_size,
    output reg tub_exist_0, tub_exist_1, tub_exist_2, tub_exist_3,
    output reg star_exist_0, star_exist_1, star_exist_2, star_exist_3,
    output reg tub_exist_0_U, tub_exist_1_U, tub_exist_2_U, tub_exist_3_U,
    output reg TA_exist
    );


    always @(*) begin
        if((h_cnt>=tub_loc_0[19:10]) && (h_cnt<(tub_loc_0[19:10]+tub_size_0[19:10]))||((tub_loc_0[19:10]>849-tub_size_0[19:10]) && (h_cnt<(tub_size_0[19:10]-(849-tub_loc_0[19:10]+1)))))
            if((v_cnt>=tub_loc_0[9:0]) && (v_cnt<(tub_loc_0[9:0]+tub_size_0[9:0])))
                tub_exist_0 = 1;
            else tub_exist_0 = 0;
        else
            tub_exist_0 = 0;
        if((h_cnt>=tub_loc_1[19:10]) && (h_cnt<(tub_loc_1[19:10]+tub_size_1[19:10]))||((tub_loc_1[19:10]>849-tub_size_1[19:10]) && (h_cnt<(tub_size_1[19:10]-(849-tub_loc_1[19:10]+1)))))
            if((v_cnt>=tub_loc_1[9:0]) && (v_cnt<(tub_loc_1[9:0]+tub_size_1[9:0])))
                tub_exist_1 = 1;
            else tub_exist_1 = 0;
        else
            tub_exist_1 = 0;
        if((h_cnt>=tub_loc_2[19:10]) && (h_cnt<(tub_loc_2[19:10]+tub_size_2[19:10]))||((tub_loc_2[19:10]>849-tub_size_2[19:10]) && (h_cnt<(tub_size_2[19:10]-(849-tub_loc_2[19:10]+1)))))
            if((v_cnt>=tub_loc_2[9:0]) && (v_cnt<(tub_loc_2[9:0]+tub_size_2[9:0])))
                tub_exist_2 = 1;
            else tub_exist_2 = 0;
        else
            tub_exist_2 = 0;
        if((h_cnt>=tub_loc_3[19:10]) && (h_cnt<(tub_loc_3[19:10]+tub_size_3[19:10]))||((tub_loc_3[19:10]>849-tub_size_3[19:10]) && (h_cnt<(tub_size_3[19:10]-(849-tub_loc_3[19:10]+1)))))
            if((v_cnt>=tub_loc_3[9:0]) && (v_cnt<(tub_loc_3[9:0]+tub_size_3[9:0])))
                tub_exist_3 = 1;
            else tub_exist_3 = 0;
        else
            tub_exist_3 = 0;
        if((h_cnt>=tub_loc_0_U[19:10]) && (h_cnt<(tub_loc_0_U[19:10]+tub_size_0_U[19:10]))||((tub_loc_0_U[19:10]>849-tub_size_0_U[19:10]) && (h_cnt<(tub_size_0_U[19:10]-(849-tub_loc_0_U[19:10]+1)))))
            if((v_cnt>=tub_loc_0_U[9:0]) && (v_cnt<(tub_loc_0_U[9:0]+tub_size_0_U[9:0])))
                tub_exist_0_U = 1;
            else tub_exist_0_U = 0;
        else
            tub_exist_0_U = 0;
        if((h_cnt>=tub_loc_1_U[19:10]) && (h_cnt<(tub_loc_1_U[19:10]+tub_size_1_U[19:10]))||((tub_loc_1_U[19:10]>849-tub_size_1_U[19:10]) && (h_cnt<(tub_size_1_U[19:10]-(849-tub_loc_1_U[19:10]+1)))))
            if((v_cnt>=tub_loc_1_U[9:0]) && (v_cnt<(tub_loc_1_U[9:0]+tub_size_1_U[9:0])))
                tub_exist_1_U = 1;
            else tub_exist_1_U = 0;
        else
            tub_exist_1_U = 0;
        if((h_cnt>=tub_loc_2_U[19:10]) && (h_cnt<(tub_loc_2_U[19:10]+tub_size_2_U[19:10]))||((tub_loc_2_U[19:10]>849-tub_size_2_U[19:10]) && (h_cnt<(tub_size_2_U[19:10]-(849-tub_loc_2_U[19:10]+1)))))
            if((v_cnt>=tub_loc_2_U[9:0]) && (v_cnt<(tub_loc_2_U[9:0]+tub_size_2_U[9:0])))
                tub_exist_2_U = 1;
            else tub_exist_2_U = 0;
        else
            tub_exist_2_U = 0;
        if((h_cnt>=tub_loc_3_U[19:10]) && (h_cnt<(tub_loc_3_U[19:10]+tub_size_3_U[19:10]))||((tub_loc_3_U[19:10]>849-tub_size_3_U[19:10]) && (h_cnt<(tub_size_3_U[19:10]-(849-tub_loc_3_U[19:10]+1)))))
            if((v_cnt>=tub_loc_3_U[9:0]) && (v_cnt<(tub_loc_3_U[9:0]+tub_size_3_U[9:0])))
                tub_exist_3_U = 1;
            else tub_exist_3_U = 0;
        else
            tub_exist_3_U = 0;
        if((h_cnt>=star_loc_0[19:10]) && (h_cnt<(star_loc_0[19:10]+star_size_0[19:10]))||((star_loc_0[19:10]>849-star_size_0[19:10]) && (h_cnt<(star_size_0[19:10]-(849-star_loc_0[19:10]+1)))))
            if((v_cnt>=star_loc_0[9:0]) && (v_cnt<(star_loc_0[9:0]+star_size_0[9:0])))
                star_exist_0 = 1;
            else star_exist_0 = 0;
        else
            star_exist_0 = 0;
        if((h_cnt>=star_loc_1[19:10]) && (h_cnt<(star_loc_1[19:10]+star_size_1[19:10]))||((star_loc_1[19:10]>849-star_size_1[19:10]) && (h_cnt<(star_size_1[19:10]-(849-star_loc_1[19:10]+1)))))
            if((v_cnt>=star_loc_1[9:0]) && (v_cnt<(star_loc_1[9:0]+star_size_1[9:0])))
                star_exist_1 = 1;
            else star_exist_1 = 0;
        else
            star_exist_1 = 0;
        if((h_cnt>=star_loc_2[19:10]) && (h_cnt<(star_loc_2[19:10]+star_size_2[19:10]))||((star_loc_2[19:10]>849-star_size_2[19:10]) && (h_cnt<(star_size_2[19:10]-(849-star_loc_2[19:10]+1)))))
            if((v_cnt>=star_loc_2[9:0]) && (v_cnt<(star_loc_2[9:0]+star_size_2[9:0])))
                star_exist_2 = 1;
            else star_exist_2 = 0;
        else
            star_exist_2 = 0;
        if((h_cnt>=star_loc_3[19:10]) && (h_cnt<(star_loc_3[19:10]+star_size_3[19:10]))||((star_loc_3[19:10]>849-star_size_3[19:10]) && (h_cnt<(star_size_3[19:10]-(849-star_loc_3[19:10]+1)))))
            if((v_cnt>=star_loc_3[9:0]) && (v_cnt<(star_loc_3[9:0]+star_size_3[9:0])))
                star_exist_3 = 1;
            else star_exist_3 = 0;
        else
            star_exist_3 = 0;
        if((h_cnt>=TA_loc[19:10]) && (h_cnt<(TA_loc[19:10]+TA_size[19:10]))||((TA_loc[19:10]>849-TA_size[19:10]) && (h_cnt<(TA_size[19:10]-(849-TA_loc[19:10]+1)))))
            if((v_cnt>=TA_loc[9:0]) && (v_cnt<(TA_loc[9:0]+TA_size[9:0])))
                TA_exist = 1;
            else TA_exist = 0;
        else
            TA_exist = 0;
    end
    

endmodule
