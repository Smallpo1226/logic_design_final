`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/09 16:30:12
// Design Name: 
// Module Name: clock_generator
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

module clk_generator(clk, rst, clk_1hz, clk_100hz,  clk_200hz, clk_240hz, clk_10hz,clk_4hz);
input clk;
input rst;
output clk_1hz;
output clk_4hz;
output clk_10hz;
output clk_100hz;
output clk_200hz;
output clk_240hz;

reg clk_1hz;
reg clk_4hz;
reg clk_10hz;
reg clk_100hz;
reg clk_200hz;
reg clk_240hz;

reg [26:0] ct_50, ct_50_tmp;
reg [26:0] ct_4, ct_4_tmp;
reg [26:0] ct_10, ct_10_tmp;
reg [26:0] ct_100, ct_100_tmp;
reg [26:0] ct_200, ct_200_tmp;
reg [26:0] ct_240, ct_240_tmp;

reg clk_1hz_tmp;
reg clk_4hz_tmp;
reg clk_10hz_tmp;
reg clk_100hz_tmp;
reg clk_200hz_tmp;
reg clk_240hz_tmp;

always@*
    if(ct_4 == 27'd12500000) begin
        ct_4_tmp = 27'd0;
        clk_4hz_tmp = ~clk_4hz;
    end
    else begin
        ct_4_tmp = ct_4 +1'b1;
        clk_4hz_tmp = clk_4hz;
    end





always@*
    if(ct_50 == 27'd4999_9999) begin
        ct_50_tmp = 27'd0;
        clk_1hz_tmp = ~clk_1hz;
    end
    else begin
        ct_50_tmp = ct_50 +1'b1;
        clk_1hz_tmp = clk_1hz;
    end

always@*
    if(ct_10 == 27'd2499_9999) begin
        ct_10_tmp = 27'd0;
        clk_10hz_tmp = ~clk_10hz;
    end
    else begin
        ct_10_tmp = ct_10 +1'b1;
        clk_10hz_tmp = clk_10hz;
    end
    
always@*
        if(ct_100 == 27'd500_000) begin
            ct_100_tmp = 27'd0;
            clk_100hz_tmp = ~clk_100hz;
        end
        else begin
            ct_100_tmp = ct_100 +1'b1;
            clk_100hz_tmp = clk_100hz;
        end

always@*
        if(ct_200 == 27'd250_000) begin
            ct_200_tmp = 27'd0;
            clk_200hz_tmp = ~clk_200hz;
        end
        else begin
            ct_200_tmp = ct_200 +1'b1;
            clk_200hz_tmp = clk_200hz;
        end

always@*
        if(ct_240 == 27'd208334) begin
            ct_240_tmp = 27'd0;
            clk_240hz_tmp = ~clk_240hz;
        end
        else begin
            ct_240_tmp = ct_240 +1'b1;
            clk_240hz_tmp = clk_240hz;
        end
    
// flip flop
always@(posedge clk or posedge rst)
    if(rst) begin
        ct_50 <= 27'b0;
        clk_1hz <= 1'b0;
    end
    else begin
        ct_50 <= ct_50_tmp;
        clk_1hz <= clk_1hz_tmp;
    end

always@(posedge clk or posedge rst)
    if(rst) begin
        ct_4 <= 27'b0;
        clk_4hz <= 1'b0;
    end
    else begin
        ct_4 <= ct_4_tmp;
        clk_4hz <= clk_4hz_tmp;
    end
// flip flop
always@(posedge clk or posedge rst)
    if(rst) begin
        ct_10 <= 27'b0;
        clk_10hz <= 1'b0;
    end
    else begin
        ct_10 <= ct_10_tmp;
        clk_10hz <= clk_10hz_tmp;
    end

// flip flop
always@(posedge clk or posedge rst)
    if(rst) begin
        ct_100 <= 27'b0;
        clk_100hz <= 1'b0;
    end
    else begin
        ct_100 <= ct_100_tmp;
        clk_100hz <= clk_100hz_tmp;
    end   

// flip flop
always@(posedge clk or posedge rst)
    if(rst) begin
        ct_200 <= 27'b0;
        clk_200hz <= 1'b0;
    end
    else begin
        ct_200 <= ct_200_tmp;
        clk_200hz <= clk_200hz_tmp;
    end   

// flip flop
always@(posedge clk or posedge rst)
    if(rst) begin
        ct_240 <= 27'b0;
        clk_240hz <= 1'b0;
    end
    else begin
        ct_240 <= ct_240_tmp;
        clk_240hz <= clk_240hz_tmp;
    end

endmodule
