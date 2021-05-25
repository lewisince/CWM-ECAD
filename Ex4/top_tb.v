//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    

//Parameters
    parameter CLK_PERIOD = 10;

//Registers and wires
    reg clk;
    reg button;
    reg rst;
    reg err;
    reg [2:0] localcolour;
    wire [2:0] colour;


//Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic


initial begin
		rst = 1;
		button = 0;
		err = 0;
		localcolour = 3'b000;
	

//checking reset
	#(CLK_PERIOD)
	if (colour!=0) begin
		$display("***TEST FAILED - colour =%d, ***", colour);
		err=1;
	end
	#(CLK_PERIOD)
	rst = 0;
	#(CLK_PERIOD) // button = 0 or button = 1 should make colour 000 go to colour 001

	if (colour!=3'b001) begin
		$display("***TEST FAILED - colour =%d, ***", colour);
		err=1;
	end
		
	forever begin
	button = 1;
		if (colour != 6 && colour != 7) begin
		localcolour = colour;
		#(CLK_PERIOD)
			if (colour != localcolour+1) begin
				$display("***TEST FAILED - rst==0, button==1,colour =%d, ***", colour);
				err=1;
			end
		end
		else if (colour == 6) begin
		localcolour = colour;
		#(CLK_PERIOD)
			if (colour != 3'b001) begin
				$display("***TEST FAILED - rst==0, button==1,colour =%d, ***", colour);
				err=1;
			end
		end

        localcolour = colour;
	   #(CLK_PERIOD)
	   button = 0;
	   
	   #(CLK_PERIOD)
			if (colour != localcolour) begin
				$display("***TEST FAILED - rst==0, button==1,colour =%d, ***", colour);
				err=1;
			end	
	end
end
//Finish test, check for success

	
    initial begin
	   if (err==1) begin
		$display("***TEST FAILED - Counter Value =%d, ***", colour);
	   end
    end
    initial begin
	   if (err==0) begin
		$display("***TEST PASSED! ***");
	   end
    end


//Todo: Instantiate monitor module
  	monitor top (
	.rst (rst),
     	.button (button),
     	.clk (clk),
     	.colour (colour)
     	);

endmodule 
