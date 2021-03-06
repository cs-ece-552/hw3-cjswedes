/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    4-1 mux template
    s=00 > A
    s=01 > B
    s=10 > C
    s=11 > D
*/
module mux4_1(InA, InB, InC, InD, S, Out);
    input        InA, InB, InC, InD;
    input [1:0]  S;
    output       Out;
    wire         wAB, wCD;

    // YOUR CODE HERE
    mux2_1 mAB(.InA(InA), .InB(InB), .S(S[0]), .Out(wAB));
    mux2_1 mCD(.InA(InC), .InB(InD), .S(S[0]), .Out(wCD));
    mux2_1 mOUT(.InA(wAB), .InB(wCD), .S(S[1]), .Out(Out));

endmodule
