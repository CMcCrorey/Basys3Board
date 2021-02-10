`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2020 08:58:48 AM
// Design Name: 
// Module Name: clock
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
//change from hex to decimal loc tracing
//more accurate displacement tracking
//light up LEDS

module Mouse_interface(
input  clk,reset, Mouse_Clk,Mouse_Data,
    output wire [0:15] led,
    output  wire [0:6] seg,
    output wire [3:0] an 
    );

wire clk_wire;
wire [1:0] refresh_wire;
wire [3:0] digit_wire; 
wire [3:0] digit1, digit2,digit3,digit4;

Mouse_logic ml(.Mouse_Clk(Mouse_Clk), .Mouse_Data(Mouse_Data), .reset(reset), .location_bits_sseg(loc_bits), .led(led), .digit1(digit1),.digit2(digit2),.digit3(digit3),.digit4(digit4));

clk_div clk_divider(.clk(clk), .divided_clk(clk_wire));
refresh_counter rc(.clk(clk_wire), .refresh_count(refresh_wire));

Anode_control Ac(.refresh_count(refresh_wire), .an(an));

BCD_control BCD_cont(.refresh_count(refresh_wire), 
.d1_min( digit1), .d2_min(digit2), .d3_hour(digit3), .d4_hour(digit4), .digit(digit_wire));

bcd_decoder bcd_dec(.digit(digit_wire), .seg(seg));









endmodule
