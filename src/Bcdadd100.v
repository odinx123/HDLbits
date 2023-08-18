module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [100:0] c;
    //bcd_fadd bcd [99:0] (a, b, {c, cin}, {cout, c}, sum);
    
    assign c[0] = cin;
    
    generate
        genvar i;
        for (i = 0; i < 100; i+=1) begin : bcd
            bcd_fadd bcd (a[4*i+3:4*i], b[4*i+3:4*i], c[i], c[i+1], sum[4*i+3:4*i]);
        end
    endgenerate

endmodule
