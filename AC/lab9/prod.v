module prod (
    input clk, rst_b,
    output reg val, 
    output reg[7:0] data
);

reg [2:0] dai, stai;

initial begin
    dai = 0;
    stai = 0;
end

always@(posedge clk or negedge rst_b)
begin

    if(rst_b == 0)
    begin
        val = 1;
        data = 0;
    end

    if(dai == 0 && stai == 0) begin
        dai = $urandom % 3 + 3; 
        stai = $urandom % 4 + 1;
        end
    
    if(dai > 0) 
    begin
        val = 1;
        data = $urandom % 6;
        dai = dai - 1;
    end

    if(dai == 0 && stai > 0)
    begin
        val = 0;
        stai = stai - 1;
    end
    

end

endmodule

module prod_tb;

reg clk, rst_b;
wire val;
wire [7:0] data;

prod uut (.clk(clk), .rst_b(rst_b), .val(val), .data(data));

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
