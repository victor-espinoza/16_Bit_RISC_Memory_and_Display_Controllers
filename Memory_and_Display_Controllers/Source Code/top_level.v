`timescale 1ns / 1ps
/***********************************************************************
 *
 * Author:   Edward Mares
 * Partner:  Victor
 * Email:    eddy.mares@gmail.com
 * Filename: top_level.v
 * Date:     October 13, 2013
 * Version:  1.0
 *
 * Notes:    This top level module is used to pull together all of the other
 *           modules that we created into one place in order to produce our 
 *           memory and dislpay controller.
 *
 **********************************************************************/
module top_level(clk, reset, addr_step, sel_byte, we_step, din, 
                  a, b, c, d, e, f, g, a3, a2, a1, a0);
   //inputs
   input       clk, reset, addr_step, sel_byte, we_step;
   input [7:0] din;
   
   //outputs
   output      a, b, c, d, e, f, g, a3, a2, a1, a0;
   
   //wires from one module to another
   wire [3:0]  ad_out;
   wire [7:0]  byte_out, addr;
   wire [15:0] ram_dout;
   wire        clk_500, clk_addr, wr_pulse;
   
  
   //intialize 500 Hz clock that outputs to most modules
   clk_500Hz clk_500hz (clk, reset, clk_500);
   
   //initialize debounce module that outputs to address sequence module
   debounce addr_step1 (clk_500, reset, addr_step, clk_addr);
   
   //intialize debounce module that outputs to RAM module
   debounce we_step1 (clk_500, reset, we_step, wr_pulse);
   
   //initialize address sequence module that outputs to RAM module
   addr_seqr addr_seq (clk_addr, reset, addr);
   
   //initialize byte mux module that chooses what to display to display controller
   byte_mux byte_mux (sel_byte, ram_dout[15:8], addr, byte_out);
   
    // initialize ram module using Coregan IP
    ram1 ram (clk, wr_pulse, addr, {8'b11111111,din}, ram_dout);   
      
   //initialize display controller module that includes LED controller, 
	//LED clock, and an address mux
   display_controller disp_cont (clk, reset, byte_out[7:4], byte_out[3:0], 
                                 ram_dout[7:4], ram_dout[3:0], a3, a2, a1, a0, ad_out);
   
   //initialize Hex to 7 segment display that displays a hex output
   Hex_to_7seg  hex_to_7seg (a, b, c, d, e, f, g,ad_out) ;
   
   
endmodule
