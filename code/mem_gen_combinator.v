`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/07 03:57:21
// Design Name: 
// Module Name: mem_gen_combinator
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


module mem_gen_combiner(
    input clk_100hz,
    input rst,
    input [9:0] h_cnt,
    input [9:0] v_cnt,
    input [9:0] tube_h_0, tube_h_1, tube_h_2, tube_h_3,
    input [9:0] tube_v_0, tube_v_1, tube_v_2, tube_v_3,
    input [9:0] tube_height_0, tube_height_1, tube_height_2, tube_height_3,
    input [9:0] tube_width_0, tube_width_1, tube_width_2, tube_width_3,
    input  [9:0]  tube_h_0_U, tube_h_1_U, tube_h_2_U, tube_h_3_U,
    input  [9:0]  tube_v_0_U, tube_v_1_U, tube_v_2_U, tube_v_3_U,
    input  [9:0]  tube_height_0_U, tube_height_1_U, tube_height_2_U, tube_height_3_U,
    input  [9:0]  tube_width_0_U, tube_width_1_U, tube_width_2_U, tube_width_3_U,
    // input mod,
    output [16:0] pixel_addr_0, pixel_addr_1, pixel_addr_2, pixel_addr_3,
    output [16:0] pixel_addr_0_U, pixel_addr_1_U, pixel_addr_2_U, pixel_addr_3_U
);

  mem_gen u_mem_gen_0 (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (tube_h_0),
    .loc_v       (tube_v_0),
    .height      (tube_height_0),
    .width       (tube_width_0),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_0)
  );

  mem_gen u_mem_gen_1 (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (tube_h_1),
    .loc_v       (tube_v_1),
    .height      (tube_height_1),
    .width       (tube_width_1),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_1)
  );

  mem_gen u_mem_gen_2 (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (tube_h_2),
    .loc_v       (tube_v_2),
    .height      (tube_height_2),
    .width       (tube_width_2),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_2)
  );

  mem_gen u_mem_gen_3 (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (tube_h_3),
    .loc_v       (tube_v_3),
    .height      (tube_height_3),
    .width       (tube_width_3),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_3)
  );

  mem_gen_U  u_mem_gen_0_U (
    .clk                     ( clk_100hz          ),
    .rst                     ( rst          ),
    .h_cnt                   ( h_cnt        ),
    .v_cnt                   ( v_cnt        ),
    .loc_h                   ( tube_h_0_U        ),
    .loc_v                   ( (tube_v_0_U)        ),
    .height                  ( tube_height_0_U       ),
    .width                   ( tube_width_0_U        ),
    // .mod                     ( mod          ),

    .pixel_addr              ( pixel_addr_0_U   )
);
mem_gen_U  u_mem_gen_1_U (
    .clk                     ( clk_100hz          ),
    .rst                     ( rst          ),
    .h_cnt                   ( h_cnt        ),
    .v_cnt                   ( v_cnt        ),
    .loc_h                   ( tube_h_1_U        ),
    .loc_v                   ( (tube_v_1_U)        ),
    .height                  ( tube_height_1_U       ),
    .width                   ( tube_width_1_U        ),
    // .mod                     ( mod          ),

    .pixel_addr              ( pixel_addr_1_U   )
);
mem_gen_U  u_mem_gen_2_U (
    .clk                     ( clk_100hz          ),
    .rst                     ( rst          ),
    .h_cnt                   ( h_cnt        ),
    .v_cnt                   ( v_cnt        ),
    .loc_h                   ( tube_h_2_U        ),
    .loc_v                   ( (tube_v_2_U)        ),
    .height                  ( tube_height_2_U       ),
    .width                   ( tube_width_2_U        ),
    // .mod                     ( mod          ),

    .pixel_addr              ( pixel_addr_2_U   )
);
mem_gen_U  u_mem_gen_3_U (
    .clk                     ( clk_100hz          ),
    .rst                     ( rst          ),
    .h_cnt                   ( h_cnt        ),
    .v_cnt                   ( v_cnt        ),
    .loc_h                   ( tube_h_3_U        ),
    .loc_v                   ( (tube_v_3_U)        ),
    .height                  ( tube_height_3_U       ),
    .width                   ( tube_width_3_U        ),
    // .mod                     ( mod          ),

    .pixel_addr              ( pixel_addr_3_U   )
);

endmodule
