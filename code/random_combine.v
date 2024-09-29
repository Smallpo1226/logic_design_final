`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 17:20:46
// Design Name: 
// Module Name: random_combine
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


module random_combine(
    input clk_100hz,
    input rst,
    input [9:0]  tube_h_0, tube_h_1, tube_h_2, tube_h_3,
    input [9:0]  star_h_0, star_h_1, star_h_2, star_h_3,
    input [9:0]  tube_width_0, tube_width_1, tube_width_2, tube_width_3,
    input [9:0]  star_width_0, star_width_1, star_width_2, star_width_3,
    output [2:0]  tube_state_0, tube_state_1, tube_state_2, tube_state_3,
    output [2:0]  star_state_0, star_state_1, star_state_2, star_state_3
    );
    
random  u_random_0 (
    .position                ( tube_h_0   ),
    .rst                     ( rst        ),
    .limit                   ( 849-tube_width_0  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'd2),

    .state                   ( tube_state_0      )
);

random  u_random_1 (
    .position                ( tube_h_1   ),
    .rst                     ( rst        ),
    .limit                   ( 849-tube_width_1  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'd1),

    .state                   ( tube_state_1      )
);

random  u_random_2 (
    .position                ( tube_h_2   ),
    .rst                     ( rst        ),
    .limit                   ( 849-tube_width_2  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'd5),

    .state                   ( tube_state_2      )
);

random  u_random_3 (
    .position                ( tube_h_3   ),
    .rst                     ( rst        ),
    .limit                   ( 849-tube_width_3  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'd7),

    .state                   ( tube_state_3      )
);

random  u_random_star_0 (
    .position                ( star_h_0   ),
    .rst                     ( rst        ),
    .limit                   ( 849-star_width_0  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'b010),

    .state                   ( star_state_0      )
);

random  u_random_star_1 (
    .position                ( star_h_1   ),
    .rst                     ( rst        ),
    .limit                   ( 849-star_width_1  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'b001),

    .state                   ( star_state_1      )
);

random  u_random_star_2 (
    .position                ( star_h_2   ),
    .rst                     ( rst        ),
    .limit                   ( 849-star_width_2  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'b101),

    .state                   ( star_state_2      )
);

random  u_random_star_3 (
    .position                ( star_h_3   ),
    .rst                     ( rst        ),
    .limit                   ( 849-star_width_3  ),
    .clk                     ( clk_100hz        ),
    .init                    (3'b111),

    .state                   ( star_state_3      )
);
endmodule
