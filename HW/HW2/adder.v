module behavioralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
assign {carryout, out}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
//Define gates with delays
`define And and #50
`define Or or #50
`define Nand nand #50
`define Not not #50
`define Xor xor #50
`define Nor nor #50
output out, carryout;
input a, b, carryin;

wire axorb;
wire ab, nanb;
wire two;
`And andab(ab, a, b); 	//ab
`Not invab(nanb, ab); 	//a nor b
`Xor xorg(axorb, a, b); 	//a xor b

`And and2(two, carryin, axorb);
`Or or2(carryout, two, ab);

`Xor xor1(out, axorb, carryin);

endmodule

module testFullAdder;
reg a, b, carryin;
wire out, carryout;
//behavioralFullAdder adder (out, carryout, a, b, carryin);
structuralFullAdder plusplus(out, carryout, a, b, carryin);
initial begin
$display("Structural FullAdder");
$display("A B CarryIn || Sum  CarryOut | Expected Output");
a=0;b=0;carryin=0; #1000 
$display("%b  %b  %b ||  %b  %b | All false", a, b, carryin, out, carryout);
a=0;b=0;carryin=1; #1000
$display("%b  %b  %b ||  %b  %b | Sum only", a, b, carryin, out, carryout);
a=0;b=1;carryin=0; #1000
$display("%b  %b  %b ||  %b  %b | Sum only", a, b, carryin, out, carryout);
a=0;b=1;carryin=1; #1000
$display("%b  %b  %b ||  %b  %b | Carryout only", a, b, carryin, out, carryout);
a=1;b=0;carryin=0; #1000 
$display("%b  %b  %b ||  %b  %b | Sum only", a, b, carryin, out, carryout);
a=1;b=0;carryin=1; #1000 
$display("%b  %b  %b ||  %b  %b | CarryOut only", a, b, carryin, out, carryout);
a=1;b=1;carryin=0; #1000 
$display("%b  %b  %b ||  %b  %b | CarryOut only", a, b, carryin, out, carryout);
a=1;b=1;carryin=1; #1000
$display("%b  %b  %b ||  %b  %b | All true", a, b, carryin, out, carryout);
end
endmodule