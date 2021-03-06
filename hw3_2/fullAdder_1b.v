
/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 1-bit full adder
*/
module fullAdder_1b(A, B, C_in, S, C_out);
    input  A, B;
    input  C_in;
    output S;
    output C_out;
    wire w1, w2, w3, w4, w5, w6, w7;    

    // YOUR CODE HERE
    //Sum logic
    xor3 s_logic(.in1(A), .in2(B), .in3(C_in), .out(S));
    
    //Cout logic
    //level one
    nor2 l1a(.in1(A), .in2(B), .out(w7));
    not1 l1b(.in1(w7), .out(w6));
    //level 2
    nand2 l2a(.in1(A), .in2(B), .out(w1));
    not1 l2b(.in1(w1), .out(w2));
    nand2 l2c(.in1(C_in), .in2(w6), .out(w5));
    not1 l2d(.in1(w5), .out(w4));
    //level 3
    nor2 l3a(.in1(w2), .in2(w4), .out(w3));
    not1 l3b(.in1(w3), .out(C_out));

endmodule
