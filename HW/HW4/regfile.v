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
wire [31:0] input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31;
wire[31:0] WRITE =32'd0;
  // These two lines are clearly wrong.  They are included to showcase how the 
  // test harness works. Delete them after you understand the testing process, 
  // and replace them with your actual code.
//  assign ReadData1 = 42;
//  assign ReadData2 = 42;
decoder1to32 swag(WRITE, RegWrite, WriteRegister);
register32zero swole(input0, WriteData, WRITE[0], Clk);
register32 one(input1, WriteData, WRITE[1], Clk);
register32 two(input2, WriteData, WRITE[2], Clk);
register32 thr(input3, WriteData, WRITE[3], Clk);
register32 fou(input4, WriteData, WRITE[4], Clk);
register32 fiv(input5, WriteData, WRITE[5], Clk);
register32 six(input6, WriteData, WRITE[6], Clk);
register32 sev(input7, WriteData, WRITE[7], Clk);
register32 eig(input8, WriteData, WRITE[8], Clk);
register32 nin(input9, WriteData, WRITE[9], Clk);
register32 ten(input10, WriteData, WRITE[10], Clk);
register32 ele(input11, WriteData, WRITE[11], Clk);
register32 twe(input12, WriteData, WRITE[12], Clk);
register32 thn(input13, WriteData, WRITE[13], Clk);
register32 fon(input14, WriteData, WRITE[14], Clk);
register32 fin(input15, WriteData, WRITE[15], Clk);
register32 sin(input16, WriteData, WRITE[16], Clk);
register32 sen(input17, WriteData, WRITE[17], Clk);
register32 ein(input18, WriteData, WRITE[18], Clk);
register32 nen(input19, WriteData, WRITE[19], Clk);
register32 twn(input20, WriteData, WRITE[20], Clk);
register32 ton(input21, WriteData, WRITE[21], Clk);
register32 ttw(input22, WriteData, WRITE[22], Clk);
register32 tth(input23, WriteData, WRITE[23], Clk);
register32 tfo(input24, WriteData, WRITE[24], Clk);
register32 tfi(input25, WriteData, WRITE[25], Clk);
register32 tsi(input26, WriteData, WRITE[26], Clk);
register32 tse(input27, WriteData, WRITE[27], Clk);
register32 tei(input28, WriteData, WRITE[28], Clk);
register32 tni(input29, WriteData, WRITE[29], Clk);
register32 tty(input30, WriteData, WRITE[30], Clk);
register32 ony(input31, WriteData, WRITE[31], Clk);
mux32to1by32 read_one(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);
mux32to1by32 read_two(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);


endmodule
