module register_tb ();
reg clk,reset,load,store,wr1,wr2,wr_en;
reg [31:0]result,memory;
reg [4:0]rs1,rs2,rd;
wire [31:0]data1,data2,data3;


always #5 clk=~clk;

register uut (clk,reset,load,store,wr1,wr2,wr_en,result,memory,rs1,rs2,rd,data1,data2,data3);

initial begin

$dumpfile("register.vcd");
$dumpvars(0,register_tb);

clk=0;reset=0;load=0;store=0;wr1=0;wr2=0;wr_en=0;result=0;memory=0;rs1=0;rs2=0;rd=0;#10;
reset=1;#10;reset=0;
wr_en=1;load=1;memory=32'hbfbf;rd=5'd1;#10;load=0;
result=32'h2267;rd=5'd2;#10;wr_en=0;
store=1;rs2=5'd3;#10;store=0;
wr1=1;rs1=5'd1;#10;wr1=0;
wr2=1;rs2=5'd5;#10;wr2=0;


end


endmodule
