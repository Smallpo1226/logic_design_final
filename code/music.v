`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 19:19:56
// Design Name: 
// Module Name: speaker
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


module Music_generate(
    input clk,
    input rst_n,
    input up,
    input down,
    input music_en,
    input clk_mus,
    output audio_mclk,
    output audio_lrck,
    output audio_sck,
    output audio_sdin,
    input clk_100Hz
    );
    wire  vol_up_d, vol_down_d;
    wire up_pulse, down_pulse;
    wire [15:0]audio_in_left, audio_in_right;
    wire [15:0]audio_left,audio_right;

    speaker_ctl U_speaker(
        .clk(clk),
        .rst_n(rst_n),
        .audio_left(audio_in_left),
        .audio_right(audio_in_right),
        .audio_mclk(audio_mclk),
        .audio_lrck(audio_lrck),
        .audio_sck(audio_sck),
        .audio_sdin(audio_sdin)
    );
        debounce U_up(
        .pb_in(up),
        .clk(clk_100Hz),
        .rst_n(rst_n),
        .pb_debounced(vol_up_d)
    );

    debounce U_down(
        .pb_in(down),
        .clk(clk_100Hz),
        .rst_n(rst_n),
        .pb_debounced(vol_down_d)
    );

    one_pulse U_up_d(
        .in_trig(vol_up_d),
        .clk(clk_100Hz),
        .rst_n(rst_n),
        .one_pulse(up_pulse)
    );

    one_pulse U_down_d(
        .in_trig(vol_down_d),
        .clk(clk_100Hz),
        .rst_n(rst_n),
        .one_pulse(down_pulse)
    );

     audio_output audio(.music_en(music_en),.rst_n(rst_n),.clk(clk), .out(audio_sdin),.clk_1Hz(clk_mus),.audio_left(audio_in_left),.audio_right(audio_in_right),.up_pulse(up_pulse),.down_pulse(down_pulse),.clk_100Hz(clk_100Hz));


    

endmodule