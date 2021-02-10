`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2020 07:01:34 PM
// Design Name: 
// Module Name: clk_logic
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


module clk_logic(
    input clk,
    output reg [3:0] digit1_min,
    output reg [3:0] digit2_min,
    output reg [3:0] digit3_hour,
    output reg [3:0] digit4_hour
    );
    
  reg AM;  
  reg [1:0]state, nextstate;  
  integer count;
  reg [5:0] sec,min,tens,hour_1,hour_2;
    
    //minuts
    always@(posedge clk) begin
    state <= nextstate;
    count <= count +1;
        if(count == 100_000_000) begin
            sec <= sec +1;
            count<=0;
                if(sec == 60) begin
                min <= min +1;
                sec <= 0;
                 if(min ==10) begin
                    tens<=tens+1;
                    min <=0;
                    if(tens ==6) begin
                           tens<= 0;
                           hour_1<= hour_1 +1;
         
                         if (hour_2 ==1 && hour_1==2)begin
                            hour_2 <= 0;   //so it sets 12:00 to 01:00 new hour
                            hour_1 <= 1;   //to reset back to 1 from 12:00  
                            
          end
          end
          end
          end
          end
          
          
          
          if(AM) begin
            digit1_min <= min;
            digit2_min <= tens;
            digit3_hour <= hour_1;
            end
          
          
         
          
          
     end   //always end
                
   always@(posedge clk) begin  
    
    case(state) 
    //am
    2'b00: begin
    AM <= 1'b1;
    min <= 0;
    tens <= 0;
    hour_1 <= 2;    //12:00
    hour_2 <= 1;
  
     
     
       
    end
    
    //10am
    2'b01: begin
    
    end
    
    //pm
    2'b10: begin
    
    end
  
  //10pm
    2'b11: begin
    
    end
      
    

    endcase 
    
   
    end
     
endmodule
              
                
                
                
                
                
                
                
                
                
              
                
//                    if(min ==10) begin
//                    tens<=tens+1;
//                    min <=0;
//                        if(tens ==6) begin
//                           tens<= 0;
//                           hour_1<= hour_1 +1;    
//                                if(hour_1>=10 && hour_1 < 12) begin
//                                hour_1 <= 0;
//                                hour_2 <= 1;
                               
 


//   always@(posedge clk) begin
//    count <= count +1;
//        if(count == 100_000_000) begin
//            sec <= sec +1;
//            count<=0;
//                if(sec == 60) begin
//                min <= min +1;
//                sec <= 0;
          
            
                
                
                
//                    if(min ==10) begin
//                    tens<=tens+1;
//                    min <=0;
//                        if(tens ==6) begin
//                           tens<= 0;
//                           hour_1<= hour_1 +1;    
//                                if(hour_1>=10 && hour_1 < 12) begin
//                                hour_1 <= 0;
//                                hour_2 <= 1;
                                
//          end
//          end
//          end
//          end 
//          end 
          
//          if(hour_2 ==1) begin
//          hour_1 <= hour_1 +1;
//          if(hour_1 ==2) begin
//          hour_2<= 0;
//          hour_1<= hour_1 +1;  //nneeds work
//          end
//          end  
    
