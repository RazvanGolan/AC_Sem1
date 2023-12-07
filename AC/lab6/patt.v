module patt(input clk, rst_b, i, output o);
    localparam S0=0, S1=1, S2=2, S3=3, S4=4;
    reg [2:0] st, st_nxt;
    always @(*) begin
        case(st)
            S0: st_nxt =(i)? S1 :S0; //am 0->1
            S1: st_nxt =(i)? S1 :S2; //am 1->0
            S2: st_nxt =(i)? S3 :S0;//am 10->1
            S3: st_nxt =(i)? S4 :S1;//am 101->1
            S4: st_nxt =(i)? S1 :S0;//am 1011 
        endcase
    end

    assign o=(st==S4);

    always @(posedge clk, negedge rst_b) 
        if(!rst_b) st <= S0;
        else       st <= st_nxt;
endmodule
module patt_tb;
    reg clk, rst_b, i;
    wire o;
    patt i0(.clk(clk), .rst_b(rst_b), .i(i), .o(o));

    initial begin
        clk=0; repeat(20) #50 clk=~clk;
    end
    
    initial begin
        rst_b=0; #25 rst_b=1;
    end
 
    initial 
    begin
        i=1;
        #100 i=0;
        #100 i=1;
        #200 i=0;
        #100 i=1;
        #200;
    end
    
    initial begin
      #50
      $display("%d", o);
      #300 $display("%d", o);
      #100 $display("%d", o);
end
endmodule