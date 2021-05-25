//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input rst,
	input change,
	input on_off,
	input clk,
	output reg [7:0] counter_out

    );
                    
    //Todo: add registers and wires, if needed
	
    
	//Todo: add user logic
	

// logic	
always @(posedge clk) begin
	if (rst) begin
		counter_out <= #1 8'b00000000; 
	end
	else if (change == 0) begin
		counter_out <= #1 counter_out;
	end 
	else if (change && on_off) begin
		counter_out <= #1 counter_out + 8'b00000001;
	end
  	else begin
		counter_out <= #1 counter_out - 8'b00000001;
	end 		
end
endmodule
