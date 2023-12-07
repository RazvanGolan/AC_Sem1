module cons (
    input clk, rst_b, val,
    input [7:0] data, 
    output reg[7:0]sum
);

reg [7:0]prev;

always@(posedge clk or negedge rst_b)
begin

    if(!rst_b)
        begin
            prev = 0;
            sum = 0;
        end
    
    if(val)
    begin
        if(data >= prev)
        begin
            sum = sum + data;
            prev = data;
        end
    end
end

endmodule

module cons_tb;

reg clk, rst_b;
wire val1;
wire [7:0] data1;
wire [7:0] sum;

prod prod_inst(.clk(clk), .rst_b(rst_b), .data(data1), .val(val1));
cons uut (.clk(clk), .rst_b(rst_b), .val(val1), .sum(sum), .data(data1));

initial begin
    clk = 0;
    repeat(200) begin
        #50; clk = ~clk;
    end
end

initial begin
    rst_b = 0;
    #25; rst_b = 1;
end

endmodule

