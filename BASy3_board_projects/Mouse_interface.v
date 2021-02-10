`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 08:22:55 AM
// Design Name: 
// Module Name: Mouse_logic
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


module Mouse_logic(
    input Mouse_Clk,
    input Mouse_Data,
    input reset,
    output reg [15:0]  location_bits_sseg,
    output reg [0:15] led=0 ,
    output [3:0] digit1, digit2,digit3,digit4  
    );
    
   reg [32:0] Mouse_Data_reg;
   reg [5:0] Mouse_bits=0;
   reg on;
  
  
 //hex to decimal for sseg display 
assign digit1 = ((location_bits_sseg %1000)%100)%10;
assign digit2 = ((location_bits_sseg %1000)%100)/10;
assign digit3 = (location_bits_sseg %1000)/100;
assign digit4 = location_bits_sseg/1000;
       
       
        
     always @(posedge Mouse_Clk or posedge reset)
    begin
        if(reset)
            Mouse_bits <= 0;
        else if(Mouse_bits <=31) begin
            Mouse_bits <= Mouse_bits + 1;  
            end
        else 
             Mouse_bits <= 0;
    end
    
    
    
    
    
      always @(negedge Mouse_Clk or posedge reset) 
    begin
        if(reset) begin
            led <=0;
            location_bits_sseg <= 0;   
            end  
     
     else begin

//Y direction 
    if(Mouse_bits ==6 ) begin
        if(Mouse_Data ==1) begin
             led[2] <=0;
             end
             else if(Mouse_Data ==0) begin
               led[2] <=1;
               end
    end
    
    //X direction 
   
    if(Mouse_bits ==5 ) begin
        if(Mouse_Data ==1) begin
             led[0] <=1;
            
             end
             else if(Mouse_Data ==0) begin
               led[0] <=0;
           
               end
    end 
        
          //THE Mouse is left clicked and counter update  
      if(Mouse_bits==1) begin
                if(Mouse_Data==1) begin// left clicked
                location_bits_sseg <= location_bits_sseg + 1;
                                
                    if(digit2 >= 3 || digit3 >=1)
                        led[7]<=1'b1;
                        else led[7] <= 1'b0;
                        if(digit2 >= 5 || digit3 >=1 )
                        led[8] <= 1'b1;
                        else led[8] <= 1'b0;
                          if(digit2 >= 7 || digit3 >=1)
                        led[9] <= 1'b1;
                         else led[9] <= 1'b0;
                          if(digit2 >= 9 || digit3 >=1)
                        led[10] <= 1'b1;
                         else led[10] <= 1'b0;
                          if((digit3 >= 1 && digit2 >=1) || digit3 >= 2 )
                        led[11] <= 1'b1;
                         else led[11] <= 1'b0;
                        if((digit3 >= 1 && digit2 >=3) || digit3 >= 2 )
                        led[12] <= 1'b1;
                        else led[12] <= 1'b0;
                        if((digit3 >= 1 && digit2 >=5) || digit3 >= 2 )
                        led[13] <= 1'b1;
                        else led[13] <= 1'b0;
                        if((digit3 >= 1 && digit2 >=7)|| digit3 >= 2)
                        led[14] <= 1'b1;
                        else led[14] <= 1'b0;
                        if((digit3 >= 1 && digit2 >=9)|| digit3 >= 2)
                        led[15] <= 1'b1;
                        else led[15] <= 1'b0;
                   
                   if(digit3 >= 2 )
                        led[3:6] <= 4'b1111;
                        else led[3:6] <= 4'b0000;
                                 
               
            end
            end
            
            //THE Mouse is right clicked and counter update  
            
            else if(Mouse_bits==2) begin
               if(Mouse_Data==1&&location_bits_sseg>0) begin//  right clicked   
                   location_bits_sseg <= location_bits_sseg - 1;
                   end
                   
                end
      end  
      end 
   
          
endmodule

