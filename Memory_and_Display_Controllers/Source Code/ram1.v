`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Victor Espinoza
// Partner:        Edward Mares
// Email:          victor.alfonso94@gmail.com
// 
// Create Date:    20:29:34 10/13/2013 
// Design Name: 
// Module Name:    ram1 
// File Name:      ram1.v
//
// Description:    RAM module made using Coregan IP. This module stores 256 16-bit
//                 values, which we will use to display on our four seven segment 
//                 displays.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ram1(
    input clk,
    input we,
    input [7:0] addr,
    input [15:0] din,
    output [15:0] dout
    );

   //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
   ram_256x16 dut (
      .clka(clk),
      .wea(we),       // Bus [0 : 0] 
      .addra(addr),    // Bus [7 : 0] 
      .dina(din),    // Bus [15 : 0] 
      .douta(dout)); // Bus [15 : 0] 

   // INST_TAG_END ------ End INSTANTIATION Template ---------

endmodule
