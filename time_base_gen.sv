module time_base_gen #(parameter L = 521)  (
    input logic clk, reset_n,
    output logic q
);

localparam BITWIDTH = $clog2(L);

logic [BITWIDTH-1:0] time_base = 0;
always_ff@(posedge clk)
    if(reset_n == 1'b0)
        time_base <= '0;
    else
        time_base <= (time_base + 1'b1) % L;   

    assign q = (time_base == (L - 1'b1)) ? 1 : 0;
    
endmodule