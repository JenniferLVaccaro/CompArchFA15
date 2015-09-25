module behavioralDecoder(out0,out1,out2,out3, address0,address1, enable);
output out0, out1, out2, out3;
input address0, address1;
input enable;
assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule

module structuralDecoder(out0,out1,out2,out3, addr0,addr1, enable);
output out0, out1, out2, out3;
input addr0, addr1;
input enable;

wire mid0,mid1,mid2,mid3;
wire naddr0, naddr1;

//Define gates with delays
`define And and #50
`define Or or #50
`define Nand nand #50
`define Not not #50
`define Xor xor #50
`define Nor nor #50

`Not n0(naddr0, addr0);
`Not n1(naddr1, addr1);

`And ag0(mid0,naddr0,naddr1);
`And ag1(mid1,addr0,naddr1);
`And ag2(mid2,naddr0,addr1);
`And ag3(mid3,addr0,addr1);

`And eg0(out0,mid0,enable);
`And eg1(out1,mid1,enable);
`And eg2(out2,mid2,enable);
`And eg3(out3,mid3,enable);
endmodule

module testDecoder; 
reg addr0, addr1;
reg enable;
wire out0,out1,out2,out3;
//behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
structuralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable); // Swap after testing

initial begin
$display("Structural Decoder");
$display("En A0 A1|| O0 O1 O2 O3 | Expected Output");
enable=0;addr0=0;addr1=0; #1000 
$display("%b  %b  %b ||  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=1;addr1=0; #1000
$display("%b  %b  %b ||  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=0;addr1=1; #1000 
$display("%b  %b  %b ||  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=1;addr1=1; #1000 
$display("%b  %b  %b ||  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=0;addr1=0; #1000 
$display("%b  %b  %b ||  %b  %b  %b  %b | O0 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=1;addr1=0; #1000 
$display("%b  %b  %b ||  %b  %b  %b  %b | O1 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=0;addr1=1; #1000 
$display("%b  %b  %b ||  %b  %b  %b  %b | O2 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=1;addr1=1; #1000 
$display("%b  %b  %b ||  %b  %b  %b  %b | O3 Only", enable, addr0, addr1, out0, out1, out2, out3);
end
endmodule
