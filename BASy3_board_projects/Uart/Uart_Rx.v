`timescale 10us / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 05:51:28 PM
// Design Name: 
// Module Name: Uart_Rx
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
// 

module Uart_Rx(
    input clk,
    input RsRx,   //have to change to PMOD out 
    output reg [7:0] led =8'b00000000
    );
    
    
    parameter  waiting = 2'b00;
    parameter  receiving = 2'b01;
    parameter  reset = 2'b10;   
    reg [1:0] state =2'b00;
    
    
    reg [13:0]clock_count =0;  // 16x trans clk so 100mhz/9600 *16 = 651 ticks
    reg [3:0] bit_counter=0;
    reg [4:0] midbit=0;
    reg load =0; 
    reg startbitdetect=0;  
      
          
//    reg stop_bit =1'b1;
//    reg start_bit =1'b0;
//    reg [9:0] Serial_in;
    
   //add a stop bit condition
  
    
    always @(posedge clk ) begin
//     Serial_in <= {stop_bit, led,start_bit}; 
    
    clock_count <= clock_count +1;  
    
      if (clock_count >= 650) begin
        clock_count <=0;
           if (RsRx==0) begin
            load<=1;
            startbitdetect <=1;
            end
            else  begin
             load<=0;
            startbitdetect <=0;
            end
            
         end
     
      
     
     
     if(clock_count==0) begin
     
        case(state)
        
        waiting: 
        begin
        
        if(load) begin
        
        if(startbitdetect) begin
         
                if(midbit >= 4)  //maybe 8 
                begin
                if(RsRx ==0) begin
                 state <= receiving;
                 midbit <=0;
                end
                else
                state <= reset;
                 end
                 
                else 
                begin
                 midbit =midbit +1;  
                 state <=waiting;
          
                 end
         end
         end
         
         else 
         state <= waiting;
        
        end
        
        
       receiving: begin
        
        if(bit_counter < 8) begin
            if(midbit >= 7) begin   
             bit_counter <= bit_counter +1; 
                midbit <=0;   
//                   led[bit_counter] <= RsRx; 
                   led <= {RsRx, led[7:1]};  
                          
                 end
                 
                else  begin
                 midbit =midbit +1;  
                 state <= receiving;
                 end   
                        
        end 
        
        else
        state <= reset;
//      midbit<=0;   // this casue problem     
        end
        
        reset: begin
        
        if(midbit >= 7) begin   //maybe 16 
          midbit <=0;   
          state <= waiting;
         load<=0;
         startbitdetect <=0;  
         bit_counter <=0;
          midbit <=0;
          clock_count <= 1;
                end
                
                 else  begin
                 midbit =midbit +1;  
                 state <= reset;
                 end   
       
                
//          state <= waiting;
//         load<=0;
//         startbitdetect <=0;  
//         bit_counter <=0;
//          midbit <=0;
//          clock_count <= 1;
    
        end
        
        
        
        
        endcase
      
      
      
  end 
         

end
    
endmodule
