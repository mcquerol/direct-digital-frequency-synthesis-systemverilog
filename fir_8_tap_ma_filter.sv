// ESPS Lab - Implementation of an FIR Moving Average Filter

module fir_8_tap_ma_filter(
	input logic clk, input logic reset_n,
	input  logic signed [15:0] d,
	output logic signed [15:0] q
	);
	
	logic signed [15:0] del [7:0];

	integer i;
	
	always_ff@(posedge clk)
		if(reset_n == 1'b0)
			for (i = 0; i <= 7; i = i+1) begin : clear_fir
				del[i] <= 0;
			end
		else
			for (i = 0; i <= 7; i = i+1) begin : shift
				if(i == 0)
					del[i] <= d;
				else
					del[i] <= del[i-1];
			end
	
	logic signed [18:0] sum; assign sum =  del[0] + del[1] + del[2] + del[3] + del[4] + del[5] + del[6] + del[7];
	
	assign q = $signed(sum[18:3]); 	
			
endmodule 