`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/03 14:08:46
// Design Name: 
// Module Name: tube
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

//test


module tube(
    input clk,
    input rst,
    input start, restart,
    input pb_up,
    input pb_down,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output hsync,
    output vsync,
    inout PS2_DATA, PS2_CLK,
    output audio_mclk, audio_lrck, audio_sck, audio_sdin,
    output [7:0] segs,
    output [3:0] ssd_ctl,
    output [15:0] led
    );

// TA_loc Outputs
wire  [9:0]TA_h, TA_v;
wire  [9:0]  TA_height, TA_width;
// collision Outputs
wire  collision_tube;
// star_collision Outputs
wire  star_collision;
// random Outputs
wire  [2:0]  tube_state_0, tube_state_1, tube_state_2, tube_state_3;
wire  [2:0]  star_state_0, star_state_1, star_state_2, star_state_3;
// tube_loc Outputs
wire  [9:0]  tube_h_0, tube_h_1, tube_h_2, tube_h_3;
wire  [9:0]  tube_v_0, tube_v_1, tube_v_2, tube_v_3;
wire  [9:0]  tube_height_0, tube_height_1, tube_height_2, tube_height_3;
wire  [9:0]  tube_width_0, tube_width_1, tube_width_2, tube_width_3;
wire  [9:0]  tube_h_0_U, tube_h_1_U, tube_h_2_U, tube_h_3_U;
wire  [9:0]  tube_v_0_U, tube_v_1_U, tube_v_2_U, tube_v_3_U;
wire  [9:0]  tube_height_0_U, tube_height_1_U, tube_height_2_U, tube_height_3_U;
wire  [9:0]  tube_width_0_U, tube_width_1_U, tube_width_2_U, tube_width_3_U;
// star_combine Outputs
wire  [9:0]  star_h_0, star_h_1, star_h_2, star_h_3;
wire [9:0] star_v_0, star_v_1, star_v_2, star_v_3;
wire [9:0] star_height_0, star_height_1, star_height_2, star_height_3;
wire [9:0] star_width_0, star_width_1, star_width_2, star_width_3;
// area Outputs
wire tub_exist_0_U,tub_exist_1_U,tub_exist_2_U,tub_exist_3_U;
wire  tub_exist_0, tub_exist_1, tub_exist_2,tub_exist_3;
wire  star_exist_0, star_exist_1, star_exist_2, star_exist_3;
wire TA_exist;
// mem_gen Outputs
wire  [16:0]  pixel_addr_0, pixel_addr_1, pixel_addr_2, pixel_addr_3;
wire  [16:0]  pixel_addr_0_U, pixel_addr_1_U, pixel_addr_2_U, pixel_addr_3_U;
//fsm Outputs
wire  [1:0]  state;
wire screen_rst;
wire  music,collide;

wire [11:0] data;
wire [16:0] pixel_addr;
wire [11:0] pixel;
wire valid;
wire [9:0] h_cnt; //640
wire [9:0] v_cnt;  //480
wire en;
wire  clk_1hz, clk_100hz, clk_200hz, clk_10hz, clk_240hz, clk_4hz, clk_25MHz, clk_22;
wire [511:0]key_down;
wire [8:0]last_change;
wire key_valid;
wire start_de,start_one;
reg cnt_tmp;
reg [3:0]cnt;

always@(posedge clk) 
   if(key_valid)   
        cnt<= cnt_tmp;
    
always@*
cnt_tmp= cnt + 1'b1;
    
KeyboardDecoder U10(
    .key_down(key_down),
    .last_change(last_change),
    .key_valid(key_valid),
    .PS2_DATA(PS2_DATA),
    .PS2_CLK(PS2_CLK),
    .rst(rst),
    .clk(clk)
);

Music_generate u_music(.up(pb_up), .down(pb_down), .clk(clk),.clk_mus(clk_4hz),.rst_n(~rst),.audio_mclk(audio_mclk),.audio_lrck(audio_lrck),.audio_sck(audio_sck),.audio_sdin(audio_sdin),.music_en(music), .clk_100Hz(clk_100hz));
// Frequency Divider
clock_divisor clk_wiz_0_inst(
                  .clk(clk),
                  .clk1(clk_25MHz),
                  .clk22(clk_22)
              );
// clk_generator Outputs

clk_generator  u_clk_generator (
    .clk                     ( clk         ),
    .rst                     ( rst         ),
    
    .clk_1hz                 ( clk_1hz     ),
    .clk_4hz                 ( clk_4hz     ),   
    .clk_10hz                ( clk_10hz    ),
    .clk_100hz               ( clk_100hz   ),
    .clk_200hz               ( clk_200hz   ),
    .clk_240hz               ( clk_240hz   )
);

collision  u_collision (
    .tub_exist_0_U           ( tub_exist_0_U    ),
    .tub_exist_1_U           ( tub_exist_1_U    ),
    .tub_exist_2_U           ( tub_exist_2_U    ),
    .tub_exist_3_U           ( tub_exist_3_U    ),
    .tub_exist_0             ( tub_exist_0      ),
    .tub_exist_1             ( tub_exist_1      ),
    .tub_exist_2             ( tub_exist_2      ),
    .tub_exist_3             ( tub_exist_3      ),
    .star_exist_0             ( star_exist_0      ),
    .star_exist_1             ( star_exist_1      ),
    .star_exist_2             ( star_exist_2      ),
    .star_exist_3             ( star_exist_3      ),
    .TA_exist                ( TA_exist         ),

    .collision_tube          ( collision_tube   )
);

star_collision  u_star_collision (
    .TA_h                    ( TA_h             ),
    .TA_v                    ( TA_v             ),
    .TA_height               ( TA_height        ),
    .TA_width                ( TA_width         ),
    .star_h_0                ( star_h_0         ),
    .star_h_1                ( star_h_1         ),
    .star_h_2                ( star_h_2         ),
    .star_h_3                ( star_h_3         ),
    .star_v_0                ( star_v_0         ),
    .star_v_1                ( star_v_1         ),
    .star_v_2                ( star_v_2         ),
    .star_v_3                ( star_v_3         ),
    .star_height_0           ( star_height_0    ),
    .star_height_1           ( star_height_1    ),
    .star_height_2           ( star_height_2    ),
    .star_height_3           ( star_height_3    ),
    .star_width_0            ( star_width_0     ),
    .star_width_1            ( star_width_1     ),
    .star_width_2            ( star_width_2     ),
    .star_width_3            ( star_width_3     ),

    .star_collision          ( star_collision   )
);

// Fsm Outputs
Fsm  u_Fsm (
    .start                   ( start     ),
    .restart                   ( restart     ),
    .clk                     ( clk       ),
    .rst                     ( rst       ),
    .collide                 ( collision_tube   ),

    .state                   ( state     ),
    .music                   ( music     ),
    .screen_rst              (screen_rst)
);

// assign led[0] = DOWN;
// assign led[1] = UP;
// assign led[2] = up;
// assign led[3] = down;
// assign led[4] = pb_up;
// assign led[5] = pb_down;
// assign led[7:4] = star_state_1;
// assign led[11:8] = star_state_2;
// assign led[15:12] = star_state_3;


TA_loc  u_TA_loc (
    .clk               ( clk_200hz      ),
    .rst                     ( screen_rst            ),
    .jump                    ( key_down[117]           ),

    .TA_h            ( TA_h   ),
    .TA_v            ( TA_v   ),
    .TA_height               ( TA_height      ),
    .TA_width                ( TA_width       )
);

tube_loc_combiner  u_tube_loc_combiner (
    .clk_100hz               ( clk_100hz         ),
    .rst                     ( screen_rst               ),
    .tube_state_0            ( tube_state_0      ),
    .tube_state_1            ( tube_state_1      ),
    .tube_state_2            ( tube_state_2      ),
    .tube_state_3            ( tube_state_3      ),

    .tube_h_0                ( tube_h_0          ),
    .tube_h_1                ( tube_h_1          ),
    .tube_h_2                ( tube_h_2          ),
    .tube_h_3                ( tube_h_3          ),
    .tube_v_0                ( tube_v_0          ),
    .tube_v_1                ( tube_v_1          ),
    .tube_v_2                ( tube_v_2          ),
    .tube_v_3                ( tube_v_3          ),
    .tube_height_0           ( tube_height_0     ),
    .tube_height_1           ( tube_height_1     ),
    .tube_height_2           ( tube_height_2     ),
    .tube_height_3           ( tube_height_3     ),
    .tube_width_0            ( tube_width_0      ),
    .tube_width_1            ( tube_width_1      ),
    .tube_width_2            ( tube_width_2      ),
    .tube_width_3            ( tube_width_3      ),
    .tube_h_0_U              ( tube_h_0_U        ),
    .tube_h_1_U              ( tube_h_1_U        ),
    .tube_h_2_U              ( tube_h_2_U        ),
    .tube_h_3_U              ( tube_h_3_U        ),
    .tube_v_0_U              ( tube_v_0_U        ),
    .tube_v_1_U              ( tube_v_1_U        ),
    .tube_v_2_U              ( tube_v_2_U        ),
    .tube_v_3_U              ( tube_v_3_U        ),
    .tube_height_0_U         ( tube_height_0_U   ),
    .tube_height_1_U         ( tube_height_1_U   ),
    .tube_height_2_U         ( tube_height_2_U   ),
    .tube_height_3_U         ( tube_height_3_U   ),
    .tube_width_0_U          ( tube_width_0_U    ),
    .tube_width_1_U          ( tube_width_1_U    ),
    .tube_width_2_U          ( tube_width_2_U    ),
    .tube_width_3_U          ( tube_width_3_U    )
);

star_combine  u_star_combine (
    .clk_100hz               ( clk_100hz       ),
    .rst                     ( screen_rst             ),
    .star_state_0            ( star_state_0    ),
    .star_state_1            ( star_state_1    ),
    .star_state_2            ( star_state_2    ),
    .star_state_3            ( star_state_3    ),

    .star_h_0                ( star_h_0        ),
    .star_h_1                ( star_h_1        ),
    .star_h_2                ( star_h_2        ),
    .star_h_3                ( star_h_3        ),
    .star_v_0                ( star_v_0        ),
    .star_v_1                ( star_v_1        ),
    .star_v_2                ( star_v_2        ),
    .star_v_3                ( star_v_3        ),
    .star_height_0           ( star_height_0   ),
    .star_height_1           ( star_height_1   ),
    .star_height_2           ( star_height_2   ),
    .star_height_3           ( star_height_3   ),
    .star_width_0            ( star_width_0    ),
    .star_width_1            ( star_width_1    ),
    .star_width_2            ( star_width_2    ),
    .star_width_3            ( star_width_3    )
);

random_combine  u_random_combine (
    .rst                     ( rst            ),
    .clk_100hz               ( clk_100hz      ),
    .tube_h_0                ( tube_h_0       ),
    .tube_width_0            ( tube_width_0   ),
    .tube_h_1                ( tube_h_1       ),
    .tube_width_1            ( tube_width_1   ),
    .tube_h_2                ( tube_h_2       ),
    .tube_width_2            ( tube_width_2   ),
    .tube_h_3                ( tube_h_3       ),
    .tube_width_3            ( tube_width_3   ),
    .star_h_0                ( star_h_0       ),
    .star_width_0            ( star_width_0   ),
    .star_h_1                ( star_h_1       ),
    .star_width_1            ( star_width_1   ),
    .star_h_2                ( star_h_2       ),
    .star_width_2            ( star_width_2   ),
    .star_h_3                ( star_h_3       ),
    .star_width_3            ( star_width_3   ),

    .tube_state_0            ( tube_state_0   ),
    .tube_state_1            ( tube_state_1   ),
    .tube_state_2            ( tube_state_2   ),
    .tube_state_3            ( tube_state_3   ),
    .star_state_0            ( star_state_0   ),
    .star_state_1            ( star_state_1   ),
    .star_state_2            ( star_state_2   ),
    .star_state_3            ( star_state_3   )
);

area  u_area (
    .clk                     ( clk           ),
    .rst                     ( rst           ),
    .h_cnt                   ( h_cnt         ),
    .v_cnt                   ( v_cnt         ),
    .tub_loc_0               ( {tube_h_0, tube_v_0}     ),
    .tub_size_0              ( {tube_width_0, tube_height_0}    ),
    .tub_loc_1               ( {tube_h_1, tube_v_1}     ),
    .tub_size_1              ( {tube_width_1, tube_height_1}    ),
    .tub_loc_2               ( {tube_h_2, tube_v_2}     ),
    .tub_size_2              ( {tube_width_2, tube_height_2}    ),
    .tub_loc_3               ( {tube_h_3, tube_v_3}     ),
    .tub_size_3              ( {tube_width_3, tube_height_3}    ),
    .tub_loc_0_U               ( {tube_h_0_U, tube_v_0_U}     ),
    .tub_size_0_U              ( {tube_width_0_U, tube_height_0_U}    ),
    .tub_loc_1_U               ( {tube_h_1_U, tube_v_1_U}     ),
    .tub_size_1_U              ( {tube_width_1_U, tube_height_1_U}    ),
    .tub_loc_2_U               ( {tube_h_2_U, tube_v_2_U}     ),
    .tub_size_2_U              ( {tube_width_2_U, tube_height_2_U}    ),
    .tub_loc_3_U               ( {tube_h_3_U, tube_v_3_U}     ),
    .tub_size_3_U              ( {tube_width_3_U, tube_height_3_U}    ),
    .star_loc_0               ( {star_h_0, star_v_0}     ),
    .star_size_0              ( {star_width_0, star_height_0}    ),
    .star_loc_1               ( {star_h_1, star_v_1}     ),
    .star_size_1              ( {star_width_1, star_height_1}    ),
    .star_loc_2               ( {star_h_2, star_v_2}     ),
    .star_size_2              ( {star_width_2, star_height_2}    ),
    .star_loc_3               ( {star_h_3, star_v_3}     ),
    .star_size_3              ( {star_width_3, star_height_3}    ),
    .TA_loc({TA_h, TA_v}),
    .TA_size({TA_width, TA_height}),

    .tub_exist_0             ( tub_exist_0   ),
    .tub_exist_1             ( tub_exist_1   ),
    .tub_exist_2             ( tub_exist_2   ),
    .tub_exist_3             ( tub_exist_3   ),
    .tub_exist_0_U             ( tub_exist_0_U   ),
    .tub_exist_1_U             ( tub_exist_1_U   ),
    .tub_exist_2_U             ( tub_exist_2_U   ),
    .tub_exist_3_U             ( tub_exist_3_U   ),
    .star_exist_0             ( star_exist_0   ),
    .star_exist_1             ( star_exist_1   ),
    .star_exist_2             ( star_exist_2   ),
    .star_exist_3             ( star_exist_3   ),
    .TA_exist (TA_exist)
);           

mem_gen_combiner  u_mem_gen_combiner (
    .clk_100hz               ( clk_100hz         ),
    .rst                     ( rst               ),
    .h_cnt                   ( h_cnt             ),
    .v_cnt                   ( v_cnt             ),
    .tube_h_0                ( tube_h_0          ),
    .tube_h_1                ( tube_h_1          ),
    .tube_h_2                ( tube_h_2          ),
    .tube_h_3                ( tube_h_3          ),
    .tube_v_0                ( tube_v_0          ),
    .tube_v_1                ( tube_v_1          ),
    .tube_v_2                ( tube_v_2          ),
    .tube_v_3                ( tube_v_3          ),
    .tube_height_0           ( tube_height_0     ),
    .tube_height_1           ( tube_height_1     ),
    .tube_height_2           ( tube_height_2     ),
    .tube_height_3           ( tube_height_3     ),
    .tube_width_0            ( tube_width_0      ),
    .tube_width_1            ( tube_width_1      ),
    .tube_width_2            ( tube_width_2      ),
    .tube_width_3            ( tube_width_3      ),
    .tube_h_0_U              ( tube_h_0_U        ),
    .tube_h_1_U              ( tube_h_1_U        ),
    .tube_h_2_U              ( tube_h_2_U        ),
    .tube_h_3_U              ( tube_h_3_U        ),
    .tube_v_0_U              ( tube_v_0_U        ),
    .tube_v_1_U              ( tube_v_1_U        ),
    .tube_v_2_U              ( tube_v_2_U        ),
    .tube_v_3_U              ( tube_v_3_U        ),
    .tube_height_0_U         ( tube_height_0_U   ),
    .tube_height_1_U         ( tube_height_1_U   ),
    .tube_height_2_U         ( tube_height_2_U   ),
    .tube_height_3_U         ( tube_height_3_U   ),
    .tube_width_0_U          ( tube_width_0_U    ),
    .tube_width_1_U          ( tube_width_1_U    ),
    .tube_width_2_U          ( tube_width_2_U    ),
    .tube_width_3_U          ( tube_width_3_U    ),

    .pixel_addr_0            ( pixel_addr_0      ),
    .pixel_addr_1            ( pixel_addr_1      ),
    .pixel_addr_2            ( pixel_addr_2      ),
    .pixel_addr_3            ( pixel_addr_3      ),
    .pixel_addr_0_U          ( pixel_addr_0_U    ),
    .pixel_addr_1_U          ( pixel_addr_1_U    ),
    .pixel_addr_2_U          ( pixel_addr_2_U    ),
    .pixel_addr_3_U          ( pixel_addr_3_U    )
);

// freq_div Outputs
wire  [1:0]  clk_ctl;
freq_div  u_freq_div (
    .clk                     ( clk          ),
    .rst_n                   ( ~rst        ),

    .clk_ctl                 ( clk_ctl      )
);

point  u_point (
    .rst                     ( (~screen_rst||state == 2'd3)   ),
    .touch                   ( star_collision        ),
    .clk                     ( clk_100hz          ),
    .ssd_ctl_en              (   clk_ctl ),

    .segs                    ( segs         ),
    .ssd_ctl                 ( ssd_ctl      )
);

wire [16:0] pixel_addr_bamboo_0, pixel_addr_bamboo_1, pixel_addr_bamboo_2, pixel_addr_bamboo_3;
mem_gen u_mem_gen_bamboo (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (star_h_0),
    .loc_v       (star_v_0),
    .height      (star_height_0),
    .width       (star_height_0),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_bamboo_0)
  );
  mem_gen u_mem_gen_bamboo_1 (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (star_h_1),
    .loc_v       (star_v_1),
    .height      (star_height_1),
    .width       (star_height_1),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_bamboo_1)
  );
  mem_gen u_mem_gen_bamboo_2 (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (star_h_2),
    .loc_v       (star_v_2),
    .height      (star_height_2),
    .width       (star_height_2),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_bamboo_2)
  );
  mem_gen u_mem_gen_bamboo_3 (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (star_h_3),
    .loc_v       (star_v_3),
    .height      (star_height_3),
    .width       (star_height_3),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_bamboo_3)
  );
wire [16:0] pixel_addr_panda;
mem_gen u_mem_gen_panda (
    .clk         (clk_100hz),
    .rst         (rst),
    .h_cnt       (h_cnt),
    .v_cnt       (v_cnt),
    .loc_h       (TA_h),
    .loc_v       (TA_v),
    .height      (TA_height),
    .width       (TA_width),
    // .mod         (mod),
    .pixel_addr  (pixel_addr_panda)
);

mem_addr_gen  u_mem_addr_gen_start (
    .clk                     ( clk_22         ),
    .rst                     ( rst          ),
    .h_cnt                   ( h_cnt        ),
    .v_cnt                   ( v_cnt        ),

    .pixel_addr              ( pixel_addr   )
);
wire [11:0] pixel_start;
blk_mem_gen_start u_blk_mem_gen_start(
  .clka(clk_25MHz),
  .wea(0),
  .addra(pixel_addr),
  .dina(data[11:0]),
  .douta(pixel_start)
); 
wire [11:0] pixel_panda;
blk_mem_gen_panda u_blk_mem_gen_panda(
  .clka(clk_25MHz),
  .wea(0),
  .addra(pixel_addr_panda),
  .dina(data[11:0]),
  .douta(pixel_panda)
); 

wire [11:0] pixel_bamboo;
blk_mem_gen_bamboo blk_mem_gen_bamboo_inist(
    .clka(clk_25MHz),
    .wea(0),
    .addra(star_exist_0?pixel_addr_bamboo_0:star_exist_1?pixel_addr_bamboo_2:star_exist_2?pixel_addr_bamboo_2:pixel_addr_bamboo_3),
    .dina(data[11:0]),
    .douta(pixel_bamboo)
); 

wire [11:0] pixel_tube;
blk_mem_gen_new_tubeD blk_mem_gen_new_tubeD(
    .clka(clk_25MHz),
    .wea(0),
    .addra(tub_exist_0?pixel_addr_0:tub_exist_1?pixel_addr_1:tub_exist_2?pixel_addr_2:pixel_addr_3),
    .dina(data[11:0]),
    .douta(pixel_tube)
); 
wire [11:0] pixel_tube_U;
blk_mem_gen_new_tubeU blk_mem_gen_new_tubeU_inst(
    .clka(clk_25MHz),
    .wea(0),
    .addra(tub_exist_0_U?pixel_addr_0_U:tub_exist_1_U?pixel_addr_1_U:tub_exist_2_U?pixel_addr_2_U:pixel_addr_3_U),
    .dina(data[11:0]),
    .douta(pixel_tube_U)
); 
// wire [11:0] pixel_tube;
// blk_mem_gen_D3 blk_mem_gen_new_tubeD(
//     .clka(clk_25MHz),
//     .wea(0),
//     .addra(tub_exist_0?pixel_addr_0:tub_exist_1?pixel_addr_1:tub_exist_2?pixel_addr_2:pixel_addr_3),
//     .dina(data[11:0]),
//     .douta(pixel_tube)
// ); 
// wire [11:0] pixel_tube_U;
// blk_mem_gen_tubeupdown2 blk_mem_gen_new_tubeU_inst(
//     .clka(clk_25MHz),
//     .wea(0),
//     .addra(tub_exist_0_U?pixel_addr_0_U:tub_exist_1_U?pixel_addr_1_U:tub_exist_2_U?pixel_addr_2_U:pixel_addr_3_U),
//     .dina(data[11:0]),
//     .douta(pixel_tube_U)
// ); 
wire [11:0] pixel_star;

// Render the picture by VGA controller
vga_controller   vga_inst(
                     .pclk(clk_25MHz),
                     .reset(rst),
                     .hsync(hsync),
                     .vsync(vsync),
                     .valid(valid),
                     .h_cnt(h_cnt),
                     .v_cnt(v_cnt)
                 );

vga_showmodule  u_vga_showmodule (
    .tub_exist_0             ( tub_exist_0     ),
    .tub_exist_1             ( tub_exist_1     ),
    .tub_exist_2             ( tub_exist_2     ),
    .tub_exist_3             ( tub_exist_3     ),
    .tub_exist_0_U           ( tub_exist_0_U   ),
    .tub_exist_1_U           ( tub_exist_1_U   ),
    .tub_exist_2_U           ( tub_exist_2_U   ),
    .tub_exist_3_U           ( tub_exist_3_U   ),
    .star_exist_0             ( star_exist_0   ),
    .star_exist_1             ( star_exist_1   ),
    .star_exist_2             ( star_exist_2   ),
    .star_exist_3             ( star_exist_3   ),
    .TA_exist (TA_exist),
    .valid                   ( valid           ),
    .pixel_tube(pixel_tube),
    .pixel_tube_U(pixel_tube_U),
    .pixel_star(pixel_bamboo),
    .pixel_start(pixel_start),
    .pixel_panda(pixel_panda),
    .state(state),
    .vgaRed                  ( vgaRed          ),
    .vgaGreen                ( vgaGreen        ),
    .vgaBlue                 ( vgaBlue         )
);

endmodule
