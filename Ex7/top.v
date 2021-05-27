//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module selector (
    //Todo: add ports 
	input clk,
	input sel,
	input rst,
	input button,
	output [23:0] light

    );
                    
    //Todo: add registers and wires, if needed
	
	wire colour;
	wire [23:0] rgb;
	wire [23:0] white;
    //Todo: add user logic

	assign white[23:0] = 24'hFFFFFF;
	lights mylights(clk, rst, button, colour);
	converter myconverter(clk, colour, !rst, rgb);
	mux mymux(white, rgb, sel, light);

endmodule 
