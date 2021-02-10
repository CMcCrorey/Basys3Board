`timescale 10ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 03:57:29 PM
// Design Name: 
// Module Name: Uart_rx2
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


module Uart_rx2(

   input clk,
    input RsRx,   //have to change to PMOD out 
    output  [7:0] led 
    );
    
    
    parameter  waiting = 2'b00;
    parameter  receiving = 2'b01;
    parameter  reset = 2'b10;   
    reg [1:0] state =2'b00;
    
    
    reg [13:0]clock_count =0;  // 16x trans clk so 100mhz/9600 *16 = 651 ticks
    reg [3:0] bit_counter=0;
    reg [4:0] midbit=0; 
    reg startbitdetect=0;  
      
          

    reg [9:0] serial_in;
    
 
  assign led = serial_in[8:1];
    
    always @(posedge clk ) begin    
    clock_count <= clock_count +1;  
    
      if (clock_count >= 650) begin
        clock_count <=0;
           if (RsRx==0) begin
            startbitdetect <=1;
            end
            else  begin
            startbitdetect <=0;
            end
            
         end
     
      
     
     
     if(clock_count==0) begin
     
        case(state)
        
        waiting: 
        begin
             if(startbitdetect) begin
                if(midbit >= 7)  //maybe 8 
                begin
                 state <= receiving;
                 midbit <=0;
                  serial_in <= {RsRx, serial_in[9:1]};  
                end

                else begin
                 midbit =midbit +1;  
                 state <=waiting;
                 end
       end
       
       end
        
        
       receiving: begin

        if(bit_counter < 9) begin
            if(midbit >= 15) begin   
             bit_counter <= bit_counter +1; 
                midbit <=0;   
                   serial_in <= {RsRx, serial_in[9:1]};  
                          
                 end
                 
                else  begin
                 midbit =midbit +1;  
                 state <= receiving;
                 end   
                        
        end 
        
        else
        state <= reset;
        end
        
        reset: begin
        
      
          midbit <=0;   
          state <= waiting;
         startbitdetect <=0;  
         bit_counter <=0;
          midbit <=0;
          clock_count <= 0;
                end
          
        endcase     
          
  end 
         
end
    
endmodule
