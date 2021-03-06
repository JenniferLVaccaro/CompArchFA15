module hw1test;
reg A;			// The input A
reg B;			// The input B
wire nA;		//
wire nB;		//
wire nAandnB;		//
wire nAandB;
wire AandB;		//
not Ainv(nA, A);	//
not Binv(nB, B);	//
and andgate1(nAandnB, nA, nB);	//
and andgate2(AandB, A, B);	//
not AandBinv(nAandB, AandB);	//

// Place initial block here!
initial begin
$display("A B | ~A ~B  | ~A~B  ~(A+B)| ~(AB) ~A+~B");	//
A=0;B=0; #1				//
$display("%b %b |  %b  %b  |   %b     %b   |   %b    %b", A,B, nA, nB, nAandnB, nAandnB, nAandB, nAandB);
A=0;B=1; #1				//
$display("%b %b |  %b  %b  |   %b     %b   |   %b    %b", A,B, nA, nB, nAandnB, nAandnB, nAandB, nAandB);
A=1;B=0; #1				//
$display("%b %b |  %b  %b  |   %b     %b   |   %b    %b", A,B, nA, nB, nAandnB, nAandnB, nAandB, nAandB);
A=1;B=1; #1				//
$display("%b %b |  %b  %b  |   %b     %b   |   %b    %b", A,B, nA, nB, nAandnB, nAandnB, nAandB, nAandB);
end
endmodule