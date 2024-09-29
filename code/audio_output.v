`timescale 1ns / 1ns
`define C2  22'd382233
`define Cs2 22'd360776
`define D2  22'd340529
`define Ds2 22'd321419
`define E2  22'd303379
`define F2  22'd286352
`define Fs2 22'd270270
`define G2  22'd255102
`define Gs2 22'd240789
`define A2  22'd227272
`define As2 22'd214518
`define B2  22'd202478

`define C3  22'd191109
`define Cs3 22'd180388
`define D3  22'd170264
`define Ds3 22'd160704
`define E3  22'd151685
`define F3  22'd143172
`define Fs3 22'd135138
`define G3  22'd127551
`define Gs3 22'd120394
`define A3  22'd113636
`define As3 22'd107259
`define B3  22'd101239
`define ze  22'd0

`define C4 22'd95556
`define Cs4 22'd90192
`define D4  22'd85178
`define Ds4 22'd80385
`define E4  22'd75872
`define F4  22'd71586
`define Fs4 22'd67658
`define G4  22'd63856
`define Gs4 22'd60240
`define A4  22'd56818
`define As4 22'd53648
`define B4  22'd50658




module wave_generator(
    input wire clk,
    input wire [15:0] freq,
    output reg signed [9:0] wave_out
);
    reg [5:0] i;
    reg signed [7:0] amplitude [0:63];
    reg [15:0] counter = 0;

    initial begin
        amplitude[0] = 0;
        amplitude[1] = 7;
        amplitude[2] = 13;
        amplitude[3] = 19;
        amplitude[4] = 25;
        amplitude[5] = 30;
        amplitude[6] = 35;
        amplitude[7] = 40;
        amplitude[8] = 45;
        amplitude[9] = 49;
        amplitude[10] = 52;
        amplitude[11] = 55;
        amplitude[12] = 58;
        amplitude[13] = 60;
        amplitude[14] = 62;
        amplitude[15] = 63;
        amplitude[16] = 63;
        amplitude[17] = 63;
        amplitude[18] = 62;
        amplitude[19] = 60;
        amplitude[20] = 58;
        amplitude[21] = 55;
        amplitude[22] = 52;
        amplitude[23] = 49;
        amplitude[24] = 45;
        amplitude[25] = 40;
        amplitude[26] = 35;
        amplitude[27] = 30;
        amplitude[28] = 25;
        amplitude[29] = 19;
        amplitude[30] = 13;
        amplitude[31] = 7;
        amplitude[32] = 0;
        amplitude[33] = -7;
        amplitude[34] = -13;
        amplitude[35] = -19;
        amplitude[36] = -25;
        amplitude[37] = -30;
        amplitude[38] = -35;
        amplitude[39] = -40;
        amplitude[40] = -45;
        amplitude[41] = -49;
        amplitude[42] = -52;
        amplitude[43] = -55;
        amplitude[44] = -58;
        amplitude[45] = -60;
        amplitude[46] = -62;
        amplitude[47] = -63;
        amplitude[48] = -63;
        amplitude[49] = -63;
        amplitude[50] = -62;
        amplitude[51] = -60;
        amplitude[52] = -58;
        amplitude[53] = -55;
        amplitude[54] = -52;
        amplitude[55] = -49;
        amplitude[56] = -45;
        amplitude[57] = -40;
        amplitude[58] = -35;
        amplitude[59] = -30;
        amplitude[60] = -25;
        amplitude[61] = -19;
        amplitude[62] = -13;
        amplitude[63] = -7;
    end

    always @ (posedge clk) begin
      if (freq == 0) wave_out <= 0;
      else
      if (counter == freq) begin
        counter <= 0;
        wave_out <= $signed(amplitude[i]);
        i <= i + 1;
        if (i == 63) i <= 0; else i <= i + 1;
      end else counter <= counter + 1;
    end
endmodule

module audio_output(
  input wire clk,
  output reg out,
  input clk_1Hz,
  output [15:0]audio_left,
  output [15:0]audio_right,
  input music_en,
  input up_pulse,
  input down_pulse,
  input clk_100Hz,
  input rst_n,
  output [3:0]cnt
);
    wire signed [9:0] ch[0:4];
    wire signed [11:0] wave_sum;
    wire [11:0] positive_wave_sum;
    reg [15:0] freq_count [0:4];
    reg [9:0] PWM;
    reg [21:0] music_data [0:79];
    reg [31:0] play_counter;
    reg [15:0] note_counter = 0;
    reg [15:0] note_counter1 = 0;
    reg [31:0] note_data[0:1];
    reg [31:0] note_data2;
    wave_generator ch0(clk, freq_count[0], ch[0]);
    /*wave_generator ch1(clk, freq_count[1], ch[1]);
    wave_generator ch2(clk, freq_count[2], ch[2]);*/
    /*assign freq_count[0] = note_data[0][31:16];
    assign freq_count[1] = note_data[1][31:16];
    assign freq_count[2] = note_data2[31:16];*/
    assign wave_sum = /*ch[2] + ch[1] +*/ ch[0];
    assign positive_wave_sum = wave_sum * 2 + 512;
    initial begin
    music_data[0] = `E4;
    music_data[1] = `E4;
    music_data[2] = `ze;
    music_data[3] = `E4;
    music_data[4] = `ze;
    music_data[5] = `C4;
    music_data[6] = `E4;
    music_data[7] = `ze;
    music_data[8] = `G4;
    music_data[9] = `ze;
    music_data[10] = `ze;
    music_data[11] = `ze;
    music_data[12] = `G3;
    music_data[13] = `ze;
    music_data[14] = `ze;
    music_data[15] = `ze;
    music_data[16] = `C4;
    music_data[17] = `ze;
    music_data[18] = `ze;
    music_data[19] = `G3;/*C3*/
    music_data[20] = `ze;
    music_data[21] = `ze;
    music_data[22] = `E3;/*G2*/
    music_data[23] = `ze;
    music_data[24] = `ze;
    music_data[25] = `A3;
    music_data[26] = `ze;
    music_data[27] = `B3;
    music_data[28] = `ze;
    music_data[29] = `As3;
    music_data[30] = `A3;
    music_data[31] = `ze;
    music_data[32] = `G3;
    music_data[33] = `E4;
    music_data[34] = `G4;
    music_data[35] = `A4;
    music_data[36] = `ze;
    music_data[37] = `F4;
    music_data[38] = `G4;
    music_data[39] = `ze;
    music_data[40] = `E4;
    music_data[41] = `ze;
    music_data[42] = `C4;
    music_data[43] = `D4;
    music_data[44] = `B3;
    music_data[45] = `ze;
    music_data[46] = `ze;
    music_data[47] = `ze;
    music_data[48] = `C4;
    music_data[49] = `ze;
    music_data[50] = `ze;
    music_data[51] = `G3;
    music_data[52] = `ze;
    music_data[53] = `ze;
    music_data[54] = `E3;
    music_data[55] = `ze;
    music_data[56] = `ze;
    music_data[57] = `A3;
    music_data[58] = `ze;
    music_data[59] = `B3;
    music_data[60] = `ze;
    music_data[61] = `As3;
    music_data[62] = `A3;
    music_data[63] = `ze;
    music_data[64] = `G3;
    music_data[65] = `E4;
    music_data[66] = `G4;
    music_data[67] = `A4;
    music_data[68] = `ze;
    music_data[69] = `F4;
    music_data[70] = `G4;
    music_data[71] = `ze;
    music_data[72] = `E4;
    music_data[73] = `ze;
    music_data[74] = `C4;
    music_data[75] = `D4;
    music_data[76] = `B3;
    music_data[77] = `ze;
    music_data[78] = `ze;
    music_data[79] = `ze;

    end
     reg [21:0]note_div;
        parameter NOTES = 80;
       /* parameter BASS = 9'd165;
        parameter PLAY_DELAY = 100_000 - 1;*/
     always @ (posedge clk_1Hz) begin
            /* if (note_counter == 0) begin note_counter <= 1;  freq_count[0] <= music_data[0];end
             else
              if (note_counter < NOTES) begin 
              note_counter <= note_counter + 1; freq_count[0] <= music_data[note_counter];
               end*/
            if(music_en) begin
            note_div<=music_data[note_counter];
            note_counter <= note_counter + 1;
            if(note_counter==NOTES-1)
            note_counter <= 0;
               
            end
     end
     buzzer_ctl(clk,rst_n,note_div,audio_left,audio_right,up_pulse,down_pulse,clk_100Hz,cnt);     
   /* always @ (posedge clk) begin         
        if (PWM < $unsigned(positive_wave_sum)) out <= 1;
        else out <= 0;
        PWM <= PWM + 1;
    end*/
endmodule



module buzzer_ctl(
    input clk,
    input rst_n,
    input [21:0]note_div,
    output [15:0]audio_left,
    output [15:0]audio_right,
    input  up_pulse,
    input  down_pulse,
    input  clk_100Hz,
    output [3:0]cnt
    );
    reg [21:0]clk_cnt_next, clk_cnt,clk_cnt2,clk_cnt_next2;
    reg b_clk, b_clk_next,b_clk2,b_clk_next2;
    wire [15:0]amp1,amp2,amp3,amp4;

// Note frequency generation
always@(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            clk_cnt <= 22'd0;
            b_clk <= 1'd0;
        end
    else
        begin
            clk_cnt <= clk_cnt_next;
            b_clk <= b_clk_next;
        end

always@*
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
    amplitude U_amp(
            .up_pulse(up_pulse),
            .down_pulse(down_pulse),
            .clk(clk_100Hz),
            .rst_n(rst_n),
            .amp1(amp1),
            .amp2(amp2),
            .cnt(cnt)
        );
// Assign the amplitude of the note
assign audio_left = (b_clk == 1'b0) ? amp1 : amp2;
assign audio_right = (b_clk == 1'b0) ? amp1 : amp2;

endmodule