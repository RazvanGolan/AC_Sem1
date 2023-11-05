module mux_2s #(
    parameter w=4
)
(
    input [w-1:0] d0, d1, d2, d3,
    input [1:0] s,
    output [w-1:0] o
);


   assign o=(s==0)? d0: 'bz;
   assign o=(s==1)? d1: 'bz;
   assign o=(s==2)? d2: 'bz;
   assign o=(s==3)? d3: 'bz; 
    
endmodule

module mux_2s_tb #(
    parameter w=4
);
    reg [w-1:0]d0,d1,d2,d3 ;
    reg [1:0]s;
    wire [w-1:0]o ;
    mux_2s #(.w(4)) uut (.d0(d0),.d1(d1),.d2(d2),.d3(d3),.s(s),.o(o));

    initial begin
        d0 = 0; d1 = 1; d2 = 0; d3 = 0; s = 1;
        #100;
        $display("%d ", o);

        d0 = 0; d1 = 0; d2 = 7; d3 = 0; s = 2;
        #100;
        $display("%d ", o);
        
        end
  
endmodule