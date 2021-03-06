/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2-1 mux template
    InA is selected when S is 0
    InB is selected when S is 1
*/
module mux2_1(InA, InB, S, Out);
    input   InA, InB;
    input   S;
    output  Out;
    wire    ws_n, wA, wB;
    // YOUR CODE HERE
    
    not1  N1(.in1(S), .out(ws_n));
    nand2 NA1(.in1(ws_n), .in2(InA), .out(wA));
    nand2 NA2(.in1(S), .in2(InB), .out(wB));
    nand2 NA3(.in1(wA), .in2(wB), .out(Out));   

endmodule
