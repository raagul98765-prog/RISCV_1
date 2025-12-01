module top_module_tb ();

reg clk,reset,stall;

top uut (clk,reset,stall);

always #5 clk=~clk;

initial begin

    $dumpfile("top.vcd");
    $dumpvars(0);

clk=0;reset=0;#10;
reset=1;#10;reset=0;
#1000;
$finish;

end


endmodule