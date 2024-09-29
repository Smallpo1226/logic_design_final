`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 18:19:22
// Design Name: 
// Module Name: amplitude
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


module amplitude(
    input up_pulse,
    input down_pulse,
    input clk,
    input rst_n,
    output reg [15:0]amp1,
    output reg [15:0]amp2,
    output reg[3:0]cnt
    );
    reg [3:0]cnt_tmp/*, cnt*/;

always@*
    if (up_pulse && cnt != 4'd15)
        cnt_tmp = cnt + 1;
    else if (down_pulse && cnt != 4'd0)
        cnt_tmp = cnt - 1;
    else
        cnt_tmp = cnt;

always@(posedge clk or negedge rst_n)
    if (~rst_n)
        cnt <= 8;
    else
        cnt <= cnt_tmp;


always@*
    case (cnt)
        4'd0: begin amp1 = 16'h8400; amp2 = 16'h7C00; end
        4'd1: begin amp1 = 16'h8A00; amp2 = 16'h7600; end
        4'd2: begin amp1 = 16'h9000; amp2 = 16'h7000; end
        4'd3: begin amp1 = 16'h9600; amp2 = 16'h6A00; end
        4'd4: begin amp1 = 16'h9C00; amp2 = 16'h6400; end
        4'd5: begin amp1 = 16'hA200; amp2 = 16'h5E00; end
        4'd6: begin amp1 = 16'hA800; amp2 = 16'h5800; end
        4'd7: begin amp1 = 16'd60000; amp2 = 16'd500; end
        4'd8: begin amp1 = 16'hB400; amp2 = 16'h4C00; end
        4'd9: begin amp1 = 16'd20000; amp2 = 16'd5000; end
        4'd10: begin amp1 = 16'hC000; amp2 = 16'h4000; end
        4'd11: begin amp1 = 16'hC600; amp2 = 16'h3A00; end
        4'd12: begin amp1 = 16'hCC00; amp2 = 16'h3400; end
        4'd13: begin amp1 = 16'hD200; amp2 = 16'h2E00; end
        4'd14: begin amp1 = 16'hD800; amp2 = 16'h2800; end
        4'd15: begin amp1 = 16'hDE00; amp2 = 16'h2200; end
        default: begin amp1 = 16'h8400; amp2 = 16'h7C00; end
    endcase

endmodule