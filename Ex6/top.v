//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////

//ip core name

`timescale 1ns / 100ps

module converter (
    //Todo: add ports 
	input clk,
	input [2:0] colour,
	input enable,
	output [23:0] rgb

    );
                    
    //Todo: add registers and wires, if needed

    //Todo: add user logic


//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
mybram your_instance_name (
  .clka(clk),    // input wire clka
  .ena(enable),      // input wire ena
  .wea(1'b0),      // input wire [0 : 0] wea
  .addra(colour),  // input wire [2 : 0] addra
  .dina(24'b000000000000000000000000),    // input wire [23 : 0] dina
  .douta(rgb)  // output wire [23 : 0] douta
);
// INST_TAG_END ------ End INSTANTIATION Template ---------



endmodule
