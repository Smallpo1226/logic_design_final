`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/05 20:29:46
// Design Name: 
// Module Name: Fsm
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
`define scr_start 2'd1
`define scr_game 2'd2
`define scr_death 2'd3
`define enable 1
`define disable 0

module Fsm(
    input start,
    input restart,
    input clk,
    input rst,
    input collide,
    output reg [1:0]state,
    output reg music,
    output reg screen_rst,
    input clk_2
    );
    
    reg [1:0]state_next;
    always@*
    begin
        state_next = `scr_start;
        music = `disable;
        case(state)
        `scr_start:
            begin
                screen_rst = 1;
                if(start==`enable)
                begin
                    state_next =  `scr_game;
                end
                else 
                    state_next = `scr_start;
            end
        `scr_game:
            begin
                screen_rst = 0;
                if(collide==`enable)
                begin
                    state_next = `scr_death;
                    music = `disable;
                end
                else
                begin 
                    state_next = `scr_game;
                    music = `enable;
                end
            end
        `scr_death:
            begin
                screen_rst = 1;
                if(restart==`enable)
                    state_next = `scr_start;
                else
                    state_next = `scr_death;
            end                                
        default:    
            begin
                screen_rst = 1;
                state_next = `scr_start;
                music = `disable;
            end
     endcase
end
    
always@(posedge clk or posedge rst)
    if (rst)
        state <= `scr_start;
    else
        state <= state_next;    
    
endmodule