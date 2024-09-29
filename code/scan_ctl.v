`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/01 16:17:42
// Design Name: 
// Module Name: scan_ctl
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


module scan_ctl(
    input [1:0]ssd_ctl_en, // divided clock for scan control 
    input [3:0]in3, in2, in1, in0, // counter value
    output reg [3:0]ssd_ctl, // ssd display control signal 
    output reg [3:0]ssd_in  // output to ssd display
    );
    
always@*
    case (ssd_ctl_en)
        2'b00:
            begin
                ssd_ctl = 4'b0111;
                ssd_in = in3;
            end
        2'b01:
            begin
                ssd_ctl = 4'b1011;
                ssd_in = in2;
            end
        2'b10:
            begin
                ssd_ctl = 4'b1101;
                ssd_in = in1;
            end
        2'b11:
            begin
                ssd_ctl = 4'b1110;
                ssd_in = in0;
            end
        default:
            begin
                ssd_ctl = 4'b1111;
                ssd_in = 4'd0;
            end
    endcase
endmodule
