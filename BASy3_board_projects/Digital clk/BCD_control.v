`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2020 12:34:36 PM
// Design Name: 
// Module Name: BCD_control
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


module BCD_control(
   
    input [1:0] refresh_count,
    input [3:0] d1_min,d2_min,d3_hour,d4_hour,
    
    output reg [3:0] digit
    
    );
    
    always@(refresh_count) begin
    
    case(refresh_count)
     2'b00: digit = d1_min;   
     2'b01: digit =d2_min;  
     2'b10: digit =d3_hour;   
     2'b11: digit =d4_hour;   
    endcase   
    end       
endmodule
