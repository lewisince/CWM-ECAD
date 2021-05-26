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
    reg deltatemp;
    reg localheat;
    reg localcool;
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
		localheat = 0;
		localcool = 0;
		err = 0;
		temperature = 5'b10100; //start at T=20
		deltatemp = 1
		
//test logic
forever begin
	
	#(CLK_PERIOD)
		
		temperature=deltatemp ? temperature+1 : temperature-1;
		
		if ((temperature<20 && cooling==1) || (temperature>20 && heating==1)) begin
			$display("***TEST FAILED, temp = %d, heating =%d,cooling =%d***", temperature,heating,cooling);
			err=1;
		end
	    
	    else if (temperature==5'b11111) begin
		deltatemp=~deltatemp;
	    end
	    
	    else if (temperature==5'b00000) begin
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
