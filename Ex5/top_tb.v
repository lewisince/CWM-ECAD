//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module top_tb(
    );
    

//Parameters
    parameter CLK_PERIOD = 10;

//Registers and wires
    reg clk;
    reg [4:0] temperature;
    reg err;
    reg [4:0] localtemp;
    wire heating;
    wire cooling;


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
	   button = 0;
	   
	   #(CLK_PERIOD)
			if (colour != localcolour) begin
				$display("***TEST FAILED - rst==0, button==0,colour =%d, localcolour=%d.***", colour, localcolour);
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
	.temperature (temperature),
     	.heating (heating),
     	.clk (clk),
     	.cooling (cooling)
     	);

endmodule 
