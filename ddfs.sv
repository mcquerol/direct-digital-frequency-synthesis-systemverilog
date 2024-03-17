module ddfs (
    input logic clk, input logic reset_n,
    output logic [7:0] q
);

logic enable;
time_base_gen #(.L(521)) timegen (.clk(clk), .reset_n(reset_n), .q(enable));

logic [7:0] lut_address;

phase_acc acc (.clk(clk), .reset_n(reset_n), .enable(enable), .q(lut_address));
    
sine_wave_lut lut (.address(lut_address), .q(q));

endmodule