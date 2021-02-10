`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2020 09:13:02 AM
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk,
    output reg divided_clk =0
    );
      
localparam div_amount = 24999;
integer count=0;
    always@(posedge clk) begin
    if(count == div_amount)
    count <= 0;
    else 
    count <= count +1;
    end
    
    always @(posedge clk) begin
     if(count == div_amount)
    divided_clk= ~divided_clk;
    
    end
    
    
    
    
endmodule
