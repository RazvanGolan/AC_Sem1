module counter #(
    parameter w = 8,
    parameter i = 8'hff

)(

    input rst_b, c_up, clr, clk,

    output reg[w-1:0]q

);

    initial begin
        q = i;
    end

    wire[w-1:0] d;

    always @(*)
    begin
        if(rst_b == 0)
            q = i;
    end

    always @(posedge clk)
    begin

        if(clr == 1)
            q = i;

        if(c_up == 1 && clr == 0)
            q = q + 1'd1;
        

    end


endmodule

module counter_tb #(
    parameter w = 8,
    parameter i = 8'hff
);

    reg rst_b, clr, c_up, clk;
    wire [w-1:0] q;

    counter #(.w(8), .i(8'hff)) uut (.rst_b(rst_b), .clk(clk), .clr(clr), .c_up(c_up), .q(q));


    initial begin
        clk = 0;
        repeat(50)
            #50 clk = ~clk;

    
    end

    initial begin
        
        rst_b = 0;
        #5
        rst_b = 1;
    
    end

    initial begin
        
        c_up = 1;
        repeat(10)
        begin
            #400
            c_up = 0;
            #100
            c_up  = 1;
        end
    
    end

        initial begin
        
        clr = 0;
        repeat(10)
        begin
        #200
        clr = 1;
        #100
        clr = 0;
        #300
        end
    
    end

    initial begin
        repeat(10)
        begin
          #100;
            $display("%d", q);
        end
    end


endmodule