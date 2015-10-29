//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);
reg [31:0] input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31;
wire[31:0] Write=32'd0;
  // These two lines are clearly wrong.  They are included to showcase how the 
  // test harness works. Delete them after you understand the testing process, 
  // and replace them with your actual code.
//  assign ReadData1 = 42;
//  assign ReadData2 = 42;
decoder1to32 swag(WRITE, RegWrite, WriteRegister);
register32zero swole(input0, WriteData, Write[0], Clk);
register32 one(input1, WriteData, Write[1], Clk);
register32 two(input2, WriteData, Write[2], Clk);
register32 thr(input3, WriteData, Write[3], Clk);
register32 fou(input4, WriteData, Write[4], Clk);
register32 fiv(input5, WriteData, Write[5], Clk);
register32 six(input6, WriteData, Write[6], Clk);
register32 sev(input7, WriteData, Write[7], Clk);
register32 eig(input8, WriteData, Write[8], Clk);
register32 nin(input9, WriteData, Write[9], Clk);
register32 ten(input10, WriteData, Write[10], Clk);
register32 ele(input11, WriteData, Write[11], Clk);
register32 twe(input12, WriteData, Write[12], Clk);
register32 thn(input13, WriteData, Write[13], Clk);
register32 fon(input14, WriteData, Write[14], Clk);
register32 fin(input15, WriteData, Write[15], Clk);
register32 sin(input16, WriteData, Write[16], Clk);
register32 sen(input17, WriteData, Write[17], Clk);
register32 ein(input18, WriteData, Write[18], Clk);
register32 nen(input19, WriteData, Write[19], Clk);
register32 twn(input20, WriteData, Write[20], Clk);
register32 ton(input21, WriteData, Write[21], Clk);
register32 ttw(input22, WriteData, Write[22], Clk);
register32 tth(input23, WriteData, Write[23], Clk);
register32 tfo(input24, WriteData, Write[24], Clk);
register32 tfi(input25, WriteData, Write[25], Clk);
register32 tsi(input26, WriteData, Write[26], Clk);
register32 tse(input27, WriteData, Write[27], Clk);
register32 tei(input28, WriteData, Write[28], Clk);
register32 tni(input29, WriteData, Write[29], Clk);
register32 tty(input30, WriteData, Write[30], Clk);
register32 ony(input31, WriteData, Write[31], Clk);
mux32to1by32 read_one(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
mux32to1by32 read_two(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);


endmodule
