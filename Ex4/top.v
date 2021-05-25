//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input clk,
	input rst,
	input button,
	output reg [2:0] colour

    );
                    
    //Todo: add registers and wires, if needed
	 
    //Todo: add user logic

// logic
// if colour 000, colour <= colour + 1 (to 001)
// if colour 111, colour <= colour + 2 (to 001)
// if colour 110 && button = 1, colour <= colour + 3 (to 001)
// if button = 0 do nothing colour <= colour
// else colour (button 1 and colour 001-101) <= colour +1

always @(posedge clk) begin
	if (rst) begin 
		colour <= 3'b000; 
	end
	else if (colour == 3'b000) begin // if colour 000, colour <= colour + 1 (to 001)
		colour <= 3'b001;
	end 
	else if (colour == 3'b111) begin // if colour 111, colour <= colour + 2 (to 001)
		colour <= 3'b001;
	end 
	else if (colour == 3'b110 && button == 1) begin // if colour 110 && button = 1, colour <= colour + 3 (to 001)
		colour <= 3'b001;
	end 
	else if (button == 0) begin // if button = 0 do nothing colour <= colour
		colour <= colour;
	end
  	else begin // else colour (button 1 and colour 001-101) <= colour +1
		colour <= colour + 3'b001;
	end 		
end
      
endmodule

