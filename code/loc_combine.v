`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 17:20:46
// Design Name: 
// Module Name: loc_combine
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
`define TUBE_INIT_H_0 150
`define TUBE_INIT_H_1 360
`define TUBE_INIT_H_2 570
`define TUBE_INIT_H_3 780

module tube_loc_combiner(
  input clk_100hz,
  input rst,
  input [2:0] tube_state_0, tube_state_1, tube_state_2, tube_state_3,

  // tube_loc Outputs
  output  [9:0] tube_h_0, tube_h_1, tube_h_2, tube_h_3,
  output  [9:0] tube_v_0, tube_v_1, tube_v_2, tube_v_3,
  output  [9:0] tube_height_0, tube_height_1, tube_height_2, tube_height_3,
  output  [9:0] tube_width_0, tube_width_1, tube_width_2, tube_width_3,
  output  [9:0] tube_h_0_U, tube_h_1_U, tube_h_2_U, tube_h_3_U,
  output  [9:0] tube_v_0_U, tube_v_1_U, tube_v_2_U, tube_v_3_U,
  output  [9:0] tube_height_0_U, tube_height_1_U, tube_height_2_U, tube_height_3_U,
  output  [9:0] tube_width_0_U, tube_width_1_U, tube_width_2_U, tube_width_3_U
);
  
  // tube_loc module instances
  tube_loc u_tube_loc_0 (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_0),
    .tube_state       (tube_state_0),
    .updown           (1),

    .tube_h           (tube_h_0),
    .tube_v           (tube_v_0),
    .tube_height      (tube_height_0),
    .tube_width       (tube_width_0)
  );

  tube_loc u_tube_loc_1 (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_1),
    .tube_state       (tube_state_1),
    .updown           (1),

    .tube_h           (tube_h_1),
    .tube_v           (tube_v_1),
    .tube_height      (tube_height_1),
    .tube_width       (tube_width_1)
  );

  tube_loc u_tube_loc_2 (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_2),
    .tube_state       (tube_state_2),
    .updown           (1),

    .tube_h           (tube_h_2),
    .tube_v           (tube_v_2),
    .tube_height      (tube_height_2),
    .tube_width       (tube_width_2)
  );

  tube_loc u_tube_loc_3 (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_3),
    .tube_state       (tube_state_3),
    .updown           (1),

    .tube_h           (tube_h_3),
    .tube_v           (tube_v_3),
    .tube_height      (tube_height_3),
    .tube_width       (tube_width_3)
  );

  tube_loc u_tube_loc_0_U (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_0),
    .tube_state       (tube_state_0),
    .updown           (0),

    .tube_h           (tube_h_0_U),
    .tube_v           (tube_v_0_U),
    .tube_height      (tube_height_0_U),
    .tube_width       (tube_width_0_U)
  );

  tube_loc u_tube_loc_1_U (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_1),
    .tube_state       (tube_state_1),
    .updown           (0),

    .tube_h           (tube_h_1_U),
    .tube_v           (tube_v_1_U),
    .tube_height      (tube_height_1_U),
    .tube_width       (tube_width_1_U)
  );

  tube_loc u_tube_loc_2_U (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_2),
    .tube_state       (tube_state_2),
    .updown           (0),

    .tube_h           (tube_h_2_U),
    .tube_v           (tube_v_2_U),
    .tube_height      (tube_height_2_U),
    .tube_width       (tube_width_2_U)
  );

  tube_loc u_tube_loc_3_U (
    .clk              (clk_100hz),
    .rst              (rst),
    .initial_h        (`TUBE_INIT_H_3),
    .tube_state       (tube_state_3),
    .updown           (0),

    .tube_h           (tube_h_3_U),
    .tube_v           (tube_v_3_U),
    .tube_height      (tube_height_3_U),
    .tube_width       (tube_width_3_U)
  );

endmodule
