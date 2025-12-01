module data_mem_tb();
reg clk,reset,load;
reg [31:0]mem_addr,data3;
wire wr_en;
wire [31:0] memory;

always #5 clk=~clk;

data_mem uut (clk,reset,load,mem_addr,data3,wr_en,memory);

initial begin
    $dumpfile("data_mem");
    $dumpvars(0,data_mem_tb);
    $dumpvars(0,uut.mem);
    clk=0;reset=0;load=0;mem_addr=0;data3=0;#10;
    reset=1;#10;reset=0;
    load=1;mem_addr=32'h008f;#10;load=0;
    data3=32'h1234;mem_addr=32'h0002;#10;
    #100;
    $finish;

    
end
endmodule