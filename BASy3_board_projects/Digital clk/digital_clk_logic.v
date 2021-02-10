`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 04:06:14 PM
// Design Name: 
// Module Name: digital_clk_logic
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

module digital_clk_logic(
    input clk,btnC,btnL,btnD,
    input [13:0] sw,
    input btnU,
    output reg [15:0] led =0,
    output reg [3:0] digit1_min,
    output reg [3:0] digit2_min,
    output reg [3:0] digit3_hour,
    output reg [3:0] digit4_hour
    );
    
  integer count=0;
  reg [5:0] sec=0,sec2=0,min=0,tens=0,hour =0;
  reg timer =0;
  reg [13:0] alarm_time=0, snooze_time;  
    
  
    always@(posedge clk) begin
  //set alarm
       if(btnU) begin
    alarm_time = sw;
     snooze_time =sw;
   end
   
 //snooze button   
    if(btnL) begin
 alarm_time = snooze_time +2'b10;  
   end

end

always@(posedge clk) begin
  
     if(btnC) begin
    {hour ,tens [3:0] ,min [3:0]} <= sw; 
   
   end
       if(btnD) begin
   timer <= ~timer;
   led <= 0;
   sec <=0;   
   sec2 <=0;
   min <= 0;
   tens <= 0;
   end
    
    if(timer) begin
    led <= ~led;
        if(sec >=10) begin
        sec<=0; 
        sec2 <= sec2 +1;
        end
            if(sec2 >= 6) begin
             sec2 <=0;
             tens <= tens +1;
             end
                 if(tens >= 10) begin
                    tens <=0;
//                     led <= ~led;
              end 
                         
       
     digit1_min <= sec;
     digit2_min <= sec2;
     digit3_hour <= tens;
    digit4_hour <=0;
   end 
   
//   else  begin
    
    if ({hour ,tens [3:0] ,min [3:0]} == alarm_time ) begin
    led <= 16'b1111111111111111; 
    end
    else  led <=0;
    
    
    count <= count +1;
        if(count >= 1666666) begin
            sec <= sec +1;
            count<=0;
                if(sec >= 59) begin
                min <= min +1;
                sec <= 0;
                 if(min >=9) begin
                    tens<=tens+1;
                    min <=0;
                    if(tens >=5) begin
                           tens<= 0;
                           hour <= hour +1;
                           if(hour >=23) begin
                            hour <= 0;
         
          end              
          end
          end
          end
//          end
          
       digit1_min <= min;
       digit2_min <= tens;   
          
     case(hour) 
     0: begin
      digit3_hour <= 2; 
      digit4_hour <= 1; 
      end
      
      1: begin
      digit3_hour <= 1; 
      digit4_hour <= 0; 
      end
      
       
      2: begin
      digit3_hour <= 2; 
      digit4_hour <= 0; 
      end
      
       
      3: begin
      digit3_hour <= 3; 
      digit4_hour <= 0; 
      end
      
        
      4: begin
      digit3_hour <= 4; 
      digit4_hour <= 0; 
      end
      
        
      5: begin
      digit3_hour <= 5; 
      digit4_hour <= 0; 
      end
      
        
      6: begin
      digit3_hour <= 6; 
      digit4_hour <= 0; 
      end
      
        
      7: begin
      digit3_hour <= 7; 
      digit4_hour <= 0; 
      end  
      
      
       8: begin
      digit3_hour <= 8; 
      digit4_hour <= 0; 
      end  
      
       9: begin
      digit3_hour <= 9; 
      digit4_hour <= 0; 
      end  
     
     
        10: begin
      digit3_hour <= 0; 
      digit4_hour <= 1; 
      end 
      
        11: begin
      digit3_hour <= 1; 
      digit4_hour <= 1; 
      end   
     
     
     
        12: begin
      digit3_hour <= 2; 
      digit4_hour <= 1; 
      end  
     
     
       13: begin
      digit3_hour <= 1; 
      digit4_hour <= 0; 
      end
      
      14: begin
      digit3_hour <= 2; 
      digit4_hour <= 0; 
      end
      
       
      15: begin
      digit3_hour <= 3; 
      digit4_hour <= 0; 
      end
      
       
      16: begin
      digit3_hour <= 4; 
      digit4_hour <= 0; 
      end
      
        
      17: begin
      digit3_hour <= 5; 
      digit4_hour <= 0; 
      end
      
        
      18: begin
      digit3_hour <= 6; 
      digit4_hour <= 0; 
      end
      
        
      19: begin
      digit3_hour <= 7; 
      digit4_hour <= 0; 
      end
      
        
      20: begin
      digit3_hour <= 8; 
      digit4_hour <= 0; 
      end  
      
      
       21: begin
      digit3_hour <= 9; 
      digit4_hour <= 0; 
      end  
      
       22: begin
      digit3_hour <= 0; 
      digit4_hour <= 1; 
      end  
     
     
        23: begin
      digit3_hour <= 1; 
      digit4_hour <= 1; 
      end 
      
     endcase   
            
          end
          end
     
          endmodule 
          
