module phase_acc (
    input logic clk, reset_n, enable,
    output logic [7:0] q
);

always_ff @(posedge clk)
    if(reset_n == 1'b0)
        q <='0;
    else if(enable)
        q <= q + 1'b1;

endmodule
