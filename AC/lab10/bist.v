module bist (
    input clk, rst_b,
    output [3:0]sig
);

wire [4:0]i1;
wire o1;

lfsr5b lfsr5b_inst(.clk(clk), .rst_b(rst_b), .q(i1));

check check_inst(.i(i1), .o(o1));

sisr4b sisr4b_inst(.clk(clk), .rst_b(rst_b), .q(sig), .i(o1));

endmodule

module bist_tb;

wire [3:0]sig;
reg clk, rst_b;

bist uut(.clk(clk), .rst_b(rst_b), .sig(sig));

initial begin
    clk = 0;
        repeat(70)
        begin
            #50; clk = ~clk;
        end
end

initial begin
    rst_b = 0;
    #25;
    rst_b = 1;
end

endmodule