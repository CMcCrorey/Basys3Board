`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 06:03:00 PM
// Design Name: 
// Module Name: UART
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


module UART_tx  (
// 9600 baud clk is 100Mghz   100Mghz/9600 = 10416 
input clk,
input [7:0] sw,
input  btnC,
output reg RsTx=1'b1 
    );
    
    parameter  waiting = 2'b00;
    parameter  transmit = 2'b01;
    parameter  reset = 2'b10;   
    reg [1:0] state;
    
    reg [13:0]clock_count =0;  // 10416 ticks per bit but start at zer0
    reg [3:0] bit_counter=0;
    reg load =0; 
          
    reg stop_bit =1'b1;
    reg start_bit =1'b0;
    reg [9:0] Serial_out;
    
     
    
    always @(posedge clk ) begin
    
     clock_count <= clock_count +1;
         
    if (btnC) begin  //if the button is pressed load since btn pressed is logic 1
        Serial_out <= {stop_bit, sw,start_bit};  
         bit_counter <= 0;
         clock_count <= 0;   //new time  
        load <= 1'b1;
        
       end
         
    case(state)
    
    waiting: if (load) 
                state <= transmit;
                else 
                state <= waiting;
                
    transmit: begin
     
    
    if(clock_count >= 10415) begin 
    Serial_out <= Serial_out >>1;
    RsTx <= Serial_out[0];      //transmit LSB        
    bit_counter <= bit_counter +1;
    clock_count <=0;
    end

    if (bit_counter >=10) begin
    state <= reset;
    end
   
    else
    state<= transmit;
    
    end   
    
    reset: begin
    
       RsTx <=1'b1;
       clock_count <= 0;   //reset clock counjt
       bit_counter <= 0;    //bit count reset
      load <= 0;
      state <= waiting;
    end
    
     default: state <= waiting;                
    
    endcase
    
    end
      
endmodule
