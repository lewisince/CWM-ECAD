//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    

//Parameters
    parameter CLK_PERIOD = 10;

//Registers and wires
    reg clk_p;
    wire clk_n;
    reg rst_n;
    reg [4:0] temperature;
    reg err;
    reg deltatemp;
    wire heating;
    wire cooling;


//Clock generation
    initial begin
       clk_p = 1'b0;
       forever
         #(CLK_PERIOD/2) clk_p=~clk_p;
     end

//Todo: User logic

    assign clk_n=~clk_p; // clock negative == negative clock positive


initial begin
// initialise values
		err = 0;
		temperature = 5'b10100; //start at T=20
		//temperature = 5'b11000; //start at T=24
		//temperature = 5'b10000; //start at T=16
		//tested 3 cases
		deltatemp = 1;
		rst_n = 0;
		
//test logic
forever begin
	
	#(CLK_PERIOD)
		
		temperature=deltatemp ? temperature+1 : temperature-1;
		
		if ((temperature<20 && cooling==1) || (temperature>20 && heating==1)) begin
			$display("***TEST FAILED, temp = %d, heating =%d,cooling =%d***", temperature,heating,cooling);
			err=1;
		end

	    	if (cooling==1 && heating==1) begin
			$display("***TEST FAILED, both states on together");
			err=1;
		end
		
		// force temp to change to analyse rising temp and falling temp
	    else if (temperature==5'b11100) begin // temp goes down once reaching 28
		deltatemp=~deltatemp;
	    end
	    
	    else if (temperature==5'b01000) begin // temp goes back up after reaching 8
		deltatemp=~deltatemp;
		end		
	end
end
//Finish test, check for success

	
    initial begin
	   if (err==1) begin
			$display("***TEST FAILED, temp = %d, heating =%d,cooling =%d***", temperature,heating,cooling);
	   end
    end
    initial begin
	   if (err==0) begin
		$display("***TEST PASSED! ***");
	   end
    end


//Todo: Instantiate monitor module
  	top top (
	.clk_p(clk_p),
 	.clk_n(clk_n),
	.rst_n(rst_n),
	.temperature_0(temperature[0]),
	.temperature_1(temperature[1]),
	.temperature_2(temperature[2]),
	.temperature_3(temperature[3]),
	.temperature_4(temperature[4]),
    	.heating(heating),
    	.cooling(cooling)
 	);
endmodule 
