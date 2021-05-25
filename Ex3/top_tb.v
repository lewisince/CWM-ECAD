//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    

//Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg clk;
    reg change;
    reg on_off;
    reg rst;
    reg err;
    reg [7:0] local_counter;
    wire [7:0] counter_out;


//Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic

// initialise values, set counter to high, then reset instantly, expect counter to return to 0
// then step through change, on_off of ab to go through both up and down counter.

initial begin
		rst = 1;
		change = 0;
		on_off = 1;
		err = 0;
		local_counter = 8'b0000000;
	#(CLK_PERIOD*10)
		if (counter_out!=0) begin
			$display("***TEST FAILED - counter_out =%d, ***", counter_out);
			err=1;
		end
		rst = 0;
	#(CLK_PERIOD*10)
		if (counter_out!=0) begin
			$display("***TEST FAILED - counter_out =%d, ***", counter_out);
			err=1;
		end // reset checked.
		change = 1;
	forever begin
	#(CLK_PERIOD)
		local_counter=on_off ? local_counter+1 : local_counter-1;
		if (local_counter!=counter_out) begin
			$display("***TEST FAILED - rst==0, change==1, expected=%d counter_out =%d, ***", local_counter,counter_out);
			err=1;
		end
	   if (local_counter==5) begin
		on_off=~on_off;
	   end
	   if (local_counter==0) begin
		on_off=~on_off;
	   end
    end
end
//Finish test, check for success

	
    initial begin
	   if (err==1) begin
		$display("***TEST FAILED - Counter Value =%d, ***", counter_out);
	   end
    end
    initial begin
	   if (err==0) begin
		$display("***TEST PASSED! ***");
	   end
    end


//Todo: Instantiate counter module
  	monitor top (
	.rst (rst),
     	.change (change),
     	.on_off (on_off),
     	.clk (clk),
     	.counter_out (counter_out)
     	);

endmodule 
