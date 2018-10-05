`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Victor Espinoza
// Partner:        Edward Mares
// Email:          victor.alfonso94@gmail.com
// 
// Create Date:    22:07:06 10/09/2013 
// Design Name: 
// Module Name:    byte_mux 
// File Name:      byte_mux.v
//
// Description:    This multiplexer mudule is used to select what data input are to 
//                 be assigned to the b_out output and driven to the ad_mux module.
//                 The two input values consist of the 16-bit data from the ram1 
//                 module. The value of the b_out output is chosen based on the 
//                 sel input that is to come from the push button 1 on our boards.
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module byte_mux(sel, high, low, b_out);

   input                sel;
   input          [7:0] high, low;
   output         [7:0] b_out;
   reg            [7:0] b_out;

   always @(sel or high or low)
      begin
         case (sel)   
            1'b1:      b_out = high;
            1'b0:      b_out =  low;
            default: b_out = high;
         
         endcase
      end
endmodule
