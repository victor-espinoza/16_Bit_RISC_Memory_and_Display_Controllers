`timescale 1ns / 1ps
/***********************************************************************
 *
 * Author:   Edward Mares
 * Partner:  Victor
 * Email:    eddy.mares@gmail.com
 * Filename: led_clk.v
 * Date:     October 13, 2013
 * Version:  1.0
 *
 * Notes:    Display controller that implements the LED clock, LED 
 *           controller, and the address multiplexer.
 *
 **********************************************************************/
module display_controller(clk, reset, ad_high, ad_low, d_high, d_low,  
                          a3, a2, a1,a0, ad_out);
      
   input        clk, reset;
   input  [3:0] ad_high, ad_low, d_high, d_low;
   output       a3, a2, a1, a0;
   wire         a3, a2, a1, a0;
   output [3:0] ad_out;
   wire   [3:0] ad_out;
   wire         clk_250;
   wire   [1:0] seg_sel;   
   
   //initialize LED clock module
   led_clk        LED_clk   (clk, reset, clk_250);
   
   //initialize LED controller module
   led_controller LED_contr(clk_250, reset, a3, a2, a1, a0, seg_sel);
   
   //initialize address mux module
   ad_mux         Addr_mux (seg_sel, ad_high, ad_low, d_high, d_low, ad_out);

endmodule
