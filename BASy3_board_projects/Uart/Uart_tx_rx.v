`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2020 02:03:37 PM
// Design Name: 
// Module Name: Uart_tx_rx
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


module Uart_tx_rx(
    input clk,
    input btnC,
    input [7:0] sw,
    output [7:0] led
    );
    
    wire transfer;
    
    
    
    UART_tx tx( .clk(clk), .sw(sw),.RsTx(transfer),.btnC(btnC)); 
    
    Uart_rx2  rx(.clk(clk), .led(led),.RsRx(transfer));
    
    
    
    
    
endmodule
