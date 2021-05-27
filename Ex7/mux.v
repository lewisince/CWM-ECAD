//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 - Doorbell Chime
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer that chooses between two sounds, where the  
//  output is delayed by 5 ticks (not clocks!) and acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

// EDITED FOR EX 7!!!!

`timescale 1ns / 100ps

module mux (
    //Todo: define inputs here
	input [23:0] a,
	input [23:0] b,
	input sel,
	output [23:0] out
    );
    
    //Todo: define registers and wires here
	wire [23:0] out;


    //Todo: define your logic here                 
	assign #5 out = sel ? b : a  ;    // 5 tick delay, if select == 1, output b, else output a. 
	
endmodule
