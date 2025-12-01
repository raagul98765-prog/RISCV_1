module cu_tb();
reg clk,reset;
reg [31:0]instruction_code;
wire [6:0]instruction;
wire [31:0]immi;
wire wr1,wr2;
wire [4:0]rs1,rs2,rd;



cu uut (clk,reset,instruction_code,instruction,immi,wr1,wr2,rs1,rs2,rd);

always #5 clk=~clk;




initial begin

$dumpfile("cu.vcd");
$dumpvars(0,cu_tb);

clk=0;reset=0;#10;
reset=1;#10;
reset=0;
instruction_code=32'h00940333;#10;
instruction_code=32'h800100b3;#10;
instruction_code=32'h00209133;#10;
instruction_code=32'h00c54ab3;#10;
instruction_code=32'h00c55ab3;#10;
instruction_code=32'h01bd5f33;#10;
instruction_code=32'h00d67fb3;#10;
instruction_code=32'h00f768b3;#10;
instruction_code=32'h00a08513;#10;


end

endmodule
