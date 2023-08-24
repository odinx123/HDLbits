module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    assign s = a + b;
    // 正+負一定不會overflow
    // 原本是正數，兩者相加若會overflow，那麼MSB一定會是1，負數一樣1->0。
    assign overflow = (a[7] ~^ b[7]) & (s[7] ^ a[7]);

endmodule
