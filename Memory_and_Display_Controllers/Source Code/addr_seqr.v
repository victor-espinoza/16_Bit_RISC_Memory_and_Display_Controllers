`timescale 1ns / 1ps
/***********************************************************************
 *
 * Author:   Edward Mares
 * Partner:  Victor Espinoza
 * Email:    eddy.mares@gmail.com
 * Filename: addr_seqr.v
 * Date:     October 8, 2013
 * Version:  1.0
 *
 * Notes:    Outputs an 8-bit number for each location in the RAM. 
 *
 **********************************************************************/
module addr_seqr(clk, reset, addr);
   //inputs from debounced switch and global reset
   input            clk, reset;
   
   //outputs an eight bit address for each sequence through RAM
   output reg [7:0] addr;
   
   //if reset then set addr to zero. else start counting.
   always @(posedge clk or posedge reset) begin
      if (reset)
         addr = 8'b00000000;
      else
         addr = addr + 8'b00000001;
   end
endmodule
