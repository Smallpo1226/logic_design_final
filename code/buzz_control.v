`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 12:30:41
// Design Name: 
// Module Name: buzz_control
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


module buzz_control(
    clk, // clock from crystal
    rst, // active low reset
    note_div, // div for note generation
    volume_max,
    volume_min,
    audio_left, // left sound audio
    audio_right // right sound audio
    );

    // I/O declaration
    input clk; // clock from crystal
    input rst; // active low reset
    input [21:0] note_div; // div for note generation
    output [15:0] audio_left; // left sound audio
    output [15:0] audio_right; // right sound audio
    input [15:0] volume_max;
    input [15:0] volume_min;

    // Declare internal signals
    reg [21:0] clk_cnt_next, clk_cnt;
    reg b_clk, b_clk_next;

    // Note frequency generation
    always @(posedge clk or posedge rst)
    if (rst)
    begin
        clk_cnt <= 22'd0;
        b_clk <= 1'b0;
    end
    else
    begin
        clk_cnt <= clk_cnt_next;
        b_clk <= b_clk_next;
    end
        
    always @*
    if (clk_cnt == note_div)
    begin
        clk_cnt_next = 22'd0;
        b_clk_next = ~b_clk;
    end
    else
    begin
        clk_cnt_next = clk_cnt + 1'b1;
        b_clk_next = b_clk;
    end

    // Assign the amplitude of the note
    assign audio_left = (b_clk == 1'b0) ? volume_max : volume_min;
    assign audio_right = (b_clk == 1'b0) ? volume_max : volume_min;

endmodule
