module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;

wire naddress0, naddress1;
wire beg0, beg1, beg2, beg3;
wire mid0, mid1, mid2, mid3;
wire c01, c23;

//Define gates with delays
`define And and #50
`define Or or #50
`define Nand nand #50
`define Not not #50
`define Xor xor #50
`define Nor nor #50

`Not inv0(naddress0, address0);
`Not inv1(naddress1, address1);
`And ag0(beg0, naddress0, naddress1);
`And ag1(beg1, address0, naddress1);
`And ag2(beg2, naddress0, address1);
`And ag3(beg3, address0, address1);
`And if0(mid0, beg0, in0);
`And if1(mid1, beg1, in1);
`And if2(mid2, beg2, in2);
`And if3(mid3, beg3, in3);
`Or cc01(c01, mid0, mid1);
`Or cc23(c23, mid2, mid3);
`Or cc0123(out, c01, c23);
endmodule


module testMultiplexer;
reg address0, address1, in0, in1, in2, in3;
wire out;
//behavioralMultiplexer multi(out, address0,address1, in0,in1,in2,in3);
structuralMultiplexer yolo(out, address0,address1, in0,in1,in2,in3);
initial begin
$display("Structural Multiplexer");
$display("A0 A1| in0 in1 in2 in3 || Out | Expected Output");
address0=0;address1=0;in0=0;in1=0;in2=0;in3=0; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | False", address0, address1, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=0;in2=0;in3=0; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=1;in2=1;in3=1; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=0;in2=0;in3=0; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | False", address0, address1, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=1;in2=0;in3=0; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=1;in2=1;in3=1; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=0;in2=0;in3=0; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | False", address0, address1, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=0;in2=1;in3=0; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=1;in2=1;in3=1; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=0;in2=0;in3=0; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | False", address0, address1, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=0;in2=0;in3=1; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=1;in2=1;in3=1; #1000 
$display("%b  %b|  %b  %b  %b  %b || %b | True", address0, address1, in0, in1, in2, in3, out);
end
endmodule
