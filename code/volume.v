`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 12:30:41
// Design Name: 
// Module Name: volume
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


module volume(
    input clk,
    input rst,
    output reg [15:0] volume_max,
    output reg [15:0] volume_min,
    output reg [3:0] volume, 
    output reg [4:0] SSD0,
    output reg [4:0] SSD1,
    input pb_up,
    input pb_down
    );
    reg [3:0] volume_nxt;
    
    always@*
        if (pb_up)
            begin 
            if (volume == 4'b1111)
                volume_nxt = 4'd0;
            else
                volume_nxt = volume + 1'b1;
            end    
        else if (pb_down) 
            begin
            if (volume == 4'd0)
                volume_nxt = 4'b1111;
            else
                volume_nxt = volume - 1'b1;
            end
        else 
            volume_nxt = volume;
            
    always@(posedge clk or posedge rst)
        if (rst)
            volume <= 4'd0;
        else 
            volume <= volume_nxt;
            
    always@(volume)
        case(volume)
            4'd0:
                begin 
                volume_min = 16'hFA00;
                volume_max = 16'h0600;
                SSD0 = 4'd0;
                SSD1 = 4'd0;
                end
            4'd1:
                begin
                volume_min = 16'hF400;
                volume_max = 16'h0C00;
                SSD0 = 4'd1;
                SSD1 = 4'd0;
                end
            4'd2:
                begin 
                volume_min = 16'hEE00;
                volume_max = 16'h1200;
                SSD0 = 4'd2;
                SSD1 = 4'd0;
                end
            4'd3:
                begin
                volume_min = 16'hEC00;
                volume_max = 16'h1800;
                SSD0 = 4'd3;
                SSD1 = 4'd0;
                end
            4'd4:
                begin 
                volume_min = 16'hE200;
                volume_max = 16'h1E00;
                SSD0 = 4'd4;
                SSD1 = 4'd0;
                end
            4'd5:
                begin
                volume_min = 16'hDC00;
                volume_max = 16'h2400;
                SSD0 = 4'd5;
                SSD1 = 4'd0;
                end
            4'd6:
                begin 
                volume_min = 16'hD600;
                volume_max = 16'h2A00;
                SSD0 = 4'd6;
                SSD1 = 4'd0;
                end
            4'd7:
                begin
                volume_min = 16'hD000;
                volume_max = 16'h3000;
                SSD0 = 4'd7;
                SSD1 = 4'd0;
                end
            4'd8:
                begin 
                volume_min = 16'hCA00;
                volume_max = 16'h3600;
                SSD0 = 4'd8;
                SSD1 = 4'd0;
                end
            4'd9:
                begin
                volume_min = 16'hC400;
                volume_max = 16'h3C00;
                SSD0 = 4'd9;
                SSD1 = 4'd0;
                end
            4'd10:
                begin 
                volume_min = 16'hBD00;
                volume_max = 16'h4200;
                SSD0 = 4'd0;
                SSD1 = 4'd1;
                end
            4'd11:
                begin
                volume_min = 16'hA800;
                volume_max = 16'h4800;
                SSD0 = 4'd1;
                SSD1 = 4'd1;
                end
            4'd12:
                begin 
                volume_min = 16'hB200;
                volume_max = 16'h4E00;
                SSD0 = 4'd2;
                SSD1 = 4'd1;
                end
            4'd13:
                begin
                volume_min = 16'hAC00;
                volume_max = 16'h5400;
                SSD0 = 4'd3;
                SSD1 = 4'd1;
                end
            4'd14:
                begin 
                volume_min = 16'hA600;
                volume_max = 16'h5A00;
                SSD0 = 4'd4;
                SSD1 = 4'd1;
                end
            4'd15:
                begin
                volume_min = 16'hB000;
                volume_max = 16'h5FFF;
                SSD0 = 4'd5;
                SSD1 = 4'd1;
                end         
            default:
                begin 
                volume_min = 16'd0;
                volume_max = 16'd0;
                SSD0 = 4'd0;
                SSD1 = 4'd0;
                end
        endcase
        
endmodule
