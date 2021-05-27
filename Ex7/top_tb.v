//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
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
    reg rst;
    reg sel;
    reg button;
    reg enable;
    reg [23:0] locallight;
    reg [2:0] localcolour;
    reg [23:0] localrgb;
    wire [23:0] light;
    reg [23:0] rgb;
    reg [23:0] white;

//Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic
//**things to check**
// button in lights (changes 3 bit colour every tick)
// rst in lights (push back to colour = 000)
// sel in mux (changes between white vs rgb light out)
// whole system (every period should show diff colour if all enabled)




//initialise values

initial begin
		rst = 1;
		button = 0;
		err = 0;
		localcolour = 3'b000;
		colour=0;
		enable=0;
		localrgb=rgb;
		sel = 1;



//check 
// rst in lights (push back to colour = 000)

	#(CLK_PERIOD)
	if (colour!=0) begin
		$display("***TEST FAILED - colour =%d, ***", colour);
		err=1;
	end
	#(CLK_PERIOD)
	rst = 0;
	#(CLK_PERIOD*5) // button = 0 or button = 1 should make colour 000 go to colour 001

	if (colour!=3'b001) begin
		$display("***TEST FAILED - colour =%d, ***", colour);
		err=1;
	end
		
	localrgb=rgb;	
	if (rgb != localrgb) begin
		$display("***TEST FAILED, localrgb=%d, real rgb=%d, colour=%d***", localrgb, rgb, colour);
		err = 1;
	end
		


		// button in lights (changes 3 bit colour every tick)
forever begin
	button = 1;
	enable = 1;
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

	localrgb = rgb;
	colour = colour+3'b001;	
		if (enable == 1) begin
			
			if (sel) begin
				if (light == rgb) begin // if no change, fail
				$display("***TEST FAILED, rgb=%d, light=%d, sel=%d***", rgb, light, sel);
				err = 1;
				end
			end

			#(CLK_PERIOD*2) // changed colour should change rgb within 2 clock cycles
			if (rgb == localrgb) begin // if no change, fail
				$display("***TEST FAILED, localrgb=%d, real rgb=%d, colour=%d***", localrgb, rgb, colour);
				err = 1;
			end
		end	
end
end

    initial begin
	   if (err==1) begin
			$display("***TEST FAILED,***");
	   end
    end
    initial begin
	   if (err==0) begin
		$display("***TEST PASSED! ***");
	   end
    end
//Todo: Instantiate counter module
 selector top (
	.rst (rst),
     	.light (light),
     	.clk (clk),
     	.button (button),
     	.sel (sel)
     	);

endmodule 

