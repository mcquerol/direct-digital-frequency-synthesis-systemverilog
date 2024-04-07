
`timescale 1ns/1ps

`define HALF_CLOCK_PERIOD     10
`define FULL_CLOCK_PERIOD 	  20
`define RESET_PERIOD 	      40
`define TEST_PERIOD 	     400
`define SIM_DURATION       65000		

module fir_8_tap_ma_filter_tb(); 

	logic tb_local_clock   = 1'b0;
	logic tb_local_reset_n = 1'b0;
	
	logic signed [15:0] tb_test_sig = 16'sb0000000000000000;

	logic signed [15:0] tb_q;

	// ### clock generation process ...
	initial 
		begin: clock_generation_process
			tb_local_clock = 0;
			forever	
				#`HALF_CLOCK_PERIOD tb_local_clock = ~tb_local_clock;
		end
				
	// ### testbench scheduler ...

	logic [15:0] test_signal_rom [2**10-1:0];
	
	logic [10*8:1] ascii_string; 

	integer i = 0;

	initial 
		begin: reset_generation_process

			$display ("Simulation starts ...");	
			
			reset_fir_8_tap_ma_filter;
			
			// #############################################################################
			ascii_string = "Test #1";
			
			tb_test_sig =  16'sb0111111111111111;

			#`TEST_PERIOD reset_fir_8_tap_ma_filter;
			
			tb_test_sig =  16'sb0000000000000000;
			
			// #############################################################################
			ascii_string = "Test #2";		
			
			#`TEST_PERIOD 
			tb_test_sig  =  16'sb0111111111111111;
			#`FULL_CLOCK_PERIOD
			tb_test_sig  =  16'sb0000000000000000;
			#`TEST_PERIOD 
			
			reset_fir_8_tap_ma_filter;
			
			// #############################################################################
			ascii_string = "Test #3";
			
			$readmemh("low_f_sine_memory_0_360_16bit_1024.txt", test_signal_rom);
			
			for (i = 0; i < 1024; i = i+1)
				begin
					#`FULL_CLOCK_PERIOD tb_test_sig = $signed(test_signal_rom[i]);
				end
				
			tb_test_sig =  16'sb0000000000000000;
				
			reset_fir_8_tap_ma_filter;
				
			// #############################################################################
			ascii_string = "Test #4";
			
			$readmemh("high_f_sine_memory_0_360_16bit_1024.txt", test_signal_rom);

			for (i = 0; i < 1024; i = i+1)
				begin
					#`FULL_CLOCK_PERIOD tb_test_sig = $signed(test_signal_rom[i]);
				end
				
			tb_test_sig =  16'sb0000000000000000;
				
			reset_fir_8_tap_ma_filter;
			
			// #############################################################################
			ascii_string = "Test #5";
			
			$readmemh("noisy_sine_memory_0_360_16bit_1024.txt", test_signal_rom);

			for (i = 0; i < 1024; i = i+1)
				begin
					#`FULL_CLOCK_PERIOD tb_test_sig = $signed(test_signal_rom[i]);
				end
				
			tb_test_sig =  16'sb0000000000000000;
				
			reset_fir_8_tap_ma_filter;
			
			// #############################################################################
			
			ascii_string = "Done";
			
			#`SIM_DURATION
			$display ("Simulation done ...");	
			$stop();
		end
		
	fir_8_tap_ma_filter fir_8_tap_ma_filter_inst (.clk(tb_local_clock),
																 .reset_n(tb_local_reset_n),
																 .d(tb_test_sig),
																 .q(tb_q)
																 );

						
	task reset_fir_8_tap_ma_filter;
		begin
			tb_local_reset_n = 1'b0;
			#`RESET_PERIOD 
			tb_local_reset_n = 1'b1;
		end
	endtask
							

endmodule
