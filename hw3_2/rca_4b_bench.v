module rca_4b_bench;

    reg [4:0] A;
    reg [4:0] B;
    reg [4:0] Sumcalc;
    reg C_in;
    wire [3:0] SUM;
    wire        CO;
    wire        Clk;
    //2 dummy wires
    wire rst;
    wire err;
    clkrst my_clkrst( .clk(Clk), .rst(rst), .err(err));
    rca_4b DUT (.A(A[3:0]), .B(B[3:0]), .C_in(C_in),.S(SUM), .C_out(CO));
  
    initial begin
        A = 17'b0_0000_0000_0000_0000;
        B = 17'b0_0000_0000_0000_0000;
        C_in = 1'b0;
        #3200 $finish;
    end
   
    always@(posedge Clk) begin
        A[3:0] = $random;
        B[3:0] = $random;
        C_in = $random;
    end
   
    always@(negedge Clk) begin
        Sumcalc = A+B+C_in;
        $display("A: %x, B: %x, Sum: %x", A, B, SUM);
    
        if (Sumcalc[3:0] !== SUM) $display ("ERRORCHECK Sum error");
        if (Sumcalc[4] !== CO) $display ("ERRORCHECK CO error");
    end
endmodule // rca_16b_bench
