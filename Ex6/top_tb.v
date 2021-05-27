//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Parameters
    parameter CLK_PERIOD = 10;

//Registers and wires
    reg clk;
    reg [2:0] colour;
    reg err;
    reg enable;
    reg [23:0] localrgb;
    wire [23:0] rgb;

//Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
	initial begin
		colour=0;
		err=0;
		enable=0;
		localrgb=rgb;
		
			#(CLK_PERIOD*2)
				if (rgb != localrgb) begin
					$display("***TEST FAILED, localrgb=%d, real rgb=%d, colour=%d***", localrgb, rgb, colour);
					err = 1;
				end
		
		forever begin
		enable = 1;
		localrgb = rgb;
		colour = colour+3'b001;	
			if (enable == 1) begin
				#(CLK_PERIOD*2) // changed colour should change rgb within 2 clock cycles
				if (rgb == localrgb) begin // if no change, fail
					$display("***TEST FAILED, localrgb=%d, real rgb=%d, colour=%d***", localrgb, rgb, colour);
					err = 1;
				end
			end
		#(CLK_PERIOD)	
		enable = 0;
		localrgb=rgb;
		colour = colour+3'b010; // to ensure checking each colour, as +1 would form a loop (8 total outcomes)
			if (enable == 0) begin
				#(CLK_PERIOD*2) // changed colour should change rgb within 2 clock cycles
				if (rgb == localrgb) begin // if change, fail (enable is off)
					$display("***TEST FAILED, localrgb=%d, real rgb=%d, colour=%d, enable=%d***", localrgb, rgb, colour,enable);
					err = 1;
				end
			end
		end
	end


//Todo: Finish test, check for success
    initial begin
	   if (err==1) begin
			$display("***TEST FAILED, localrgb=%d, real rgb=%d, colour=%d***", localrgb, rgb, colour);
	   end
    end
    initial begin
	   if (err==0) begin
		$display("***TEST PASSED! ***");
	   end
    end
//Todo: Instantiate counter module
 converter top (
	.colour (colour),
     	.rgb (rgb),
     	.clk (clk),
     	.enable (enable)
     	);

endmodule 
