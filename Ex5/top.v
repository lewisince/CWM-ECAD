//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input clk,
	input [4:0] temperature,
	output reg heating,
	output reg cooling

    );
                    
    //Todo: add registers and wires, if needed
	 
    //Todo: add user logic

// logic
// 
always @(posedge clk) begin
	if (heating == 1 && temperature >= 5'd20) begin // heating states
		heating <= 0
	end
	else if (heating == 1 && temperature < 5'd20) begin
		heating <= heating
	end	
	else if (cooling == 1 && temperature > 5'd20) begin // cooling states
		cooling <= cooling
	end
	else if (cooling == 1 && temperature <= 5'd20) begin
		cooling <= 0
	end
	else if (heating == 0 && cooling == 0 && temperature <= 5'd18) begin // idle states
		heating <= 1
	end	
	else if (heating == 0 && cooling == 0 && temperature => 5'd22) begin
		cooling <= 1
	end
	else if (heating == 0 && cooling == 0 && temperature < 5'd22 && tempertaure > 5'd18) begin
		heating <= heating
		cooling <= cooling
	end
end
      
endmodule

