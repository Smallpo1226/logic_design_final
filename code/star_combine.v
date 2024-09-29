`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/15 14:03:14
// Design Name: 
// Module Name: star_combine
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

`define STAR_INIT_H_0 255
`define STAR_INIT_H_1 465
`define STAR_INIT_H_2 675
`define STAR_INIT_H_3 885

module star_combine(
    input clk_100hz,
    input rst,
    input [2:0] star_state_0, star_state_1, star_state_2, star_state_3,

    // star_loc Outputs
    output  [9:0] star_h_0, star_h_1, star_h_2, star_h_3,
    output  [9:0] star_v_0, star_v_1, star_v_2, star_v_3,
    output  [9:0] star_height_0, star_height_1, star_height_2, star_height_3,
    output  [9:0] star_width_0, star_width_1, star_width_2, star_width_3
    );

star_loc  u_star_loc_0 (
    .clk                     ( clk_100hz           ),
    .rst                     ( rst           ),
    .initial_h               ( `STAR_INIT_H_0     ),
    .star_state              ( star_state_0    ),

    .star_h                  ( star_h_0        ),
    .star_v                  ( star_v_0        ),
    .star_height             ( star_height_0   ),
    .star_width              ( star_width_0    )                 
    );
star_loc  u_star_loc_1 (
    .clk                     ( clk_100hz           ),
    .rst                     ( rst           ),
    .initial_h               ( `STAR_INIT_H_1     ),
    .star_state              ( star_state_1    ),

    .star_h                  ( star_h_1        ),
    .star_v                  ( star_v_1        ),
    .star_height             ( star_height_1   ),
    .star_width              ( star_width_1    )                 
    );
star_loc  u_star_loc_2 (
    .clk                     ( clk_100hz           ),
    .rst                     ( rst           ),
    .initial_h               ( `STAR_INIT_H_2     ),
    .star_state              ( star_state_2    ),

    .star_h                  ( star_h_2        ),
    .star_v                  ( star_v_2        ),
    .star_height             ( star_height_2   ),
    .star_width              ( star_width_2    )                 
    );
star_loc  u_star_loc_3 (
    .clk                     ( clk_100hz           ),
    .rst                     ( rst           ),
    .initial_h               ( `STAR_INIT_H_3     ),
    .star_state              ( star_state_3    ),

    .star_h                  ( star_h_3        ),
    .star_v                  ( star_v_3        ),
    .star_height             ( star_height_3   ),
    .star_width              ( star_width_3    )                 
    );
endmodule
