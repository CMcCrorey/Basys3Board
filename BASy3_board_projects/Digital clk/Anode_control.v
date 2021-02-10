`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2020 09:02:44 AM
// Design Name: 
// Module Name: Anode_control
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


module Anode_control(
    input [1:0] refresh_count,
    output reg [3:0] an
    );
    
    always@(refresh_count)
      case(refresh_count)
      
      2'b00: an =4'b1110;   
      2'b01: an =4'b1101;  
      2'b10: an =4'b1011;   
      2'b11: an =4'b0111;   
          
      
    endcase
    
endmodule
