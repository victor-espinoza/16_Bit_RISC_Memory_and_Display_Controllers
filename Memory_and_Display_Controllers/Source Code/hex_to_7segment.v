`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Author: 		 	 Victor Espinoza
// Email: 			 victor.alfonso94@gmail.com
// Create Date:    10:41:08 10/01/2013 
// Module Name:    hex_to_7segment 
// File Name:      hex_to_7segment.v
//
// Description:    This hex_to_7segment module basicaly takes in a four bit input
//						 and depending on what that input is, it then transfers that 
//						 information by turning on the appropriate segments (a-g) on the 
//						 seven segment display in order to represent that four bit input.
//						 This was achieved by using case statements for all of the 
//						 appropriate 4-bit input options and assigning the according
//						 values for a-g for that 4-bit input. Depending on the 4-bit
//						 value, the appropriate segments are turned on in order to 
//						 display that value.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module hex_to_7segment(hex, a, b, c, d, e, f, g);

	input 		[3:0] hex;
	output 		a, b, c, d, e, f, g;
	reg		   a, b, c, d, e, f, g;
		
	always @(hex) begin
		 case (hex)
		 
			 //7-segment display for 0-3
			 4'b0000: {a, b, c, d, e, f, g} = 7'b0000001;
			 4'b0001: {a, b, c, d, e, f, g} = 7'b1001111;
			 4'b0010: {a, b, c, d, e, f, g} = 7'b0010010;
			 4'b0011: {a, b, c, d, e, f, g} = 7'b0000110;
			 
			 //7-segment display for 4-7
			 4'b0100: {a, b, c, d, e, f, g} = 7'b1001100;
			 4'b0101: {a, b, c, d, e, f, g} = 7'b0100100;
			 4'b0110: {a, b, c, d, e, f, g} = 7'b0100000;
			 4'b0111: {a, b, c, d, e, f, g} = 7'b0001111;
			 
			 //7-segment display for 8-B
			 4'b1000: {a, b, c, d, e, f, g} = 7'b0000000;
			 4'b1001: {a, b, c, d, e, f, g} = 7'b0000100;
			 4'b1010: {a, b, c, d, e, f, g} = 7'b0001000;
			 4'b1011: {a, b, c, d, e, f, g} = 7'b1100000;
			 
			 //7-segment display for C-F
			 4'b1100: {a, b, c, d, e, f, g} = 7'b0110001;
			 4'b1101: {a, b, c, d, e, f, g} = 7'b1000010;
			 4'b1110: {a, b, c, d, e, f, g} = 7'b0110000;
			 4'b1111: {a, b, c, d, e, f, g} = 7'b0111000;
			 
			 //default display
			 default: {a, b, c, d, e, f, g} = 7'b1111111;
			 
		 endcase
	end
			
endmodule
