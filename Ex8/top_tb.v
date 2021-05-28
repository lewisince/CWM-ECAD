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
    reg clk;
    reg [4:0] temperature;
    reg err;
    reg deltatemp;
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
// initialise values
		err = 0;
		temperature = 5'b10100; //start at T=20
		//temperature = 5'b11000; //start at T=24
		//temperature = 5'b10000; //start at T=16
		//tested 3 cases
		deltatemp = 1;
		
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
  	monitor top (
	.temperature (temperature),
     	.heating (heating),
     	.clk (clk),
     	.cooling (cooling)
     	);

endmodule 
