module dff_tb;

// Inputs
reg d;
reg clk;
reg clear;

// Outputs
wire q;
wire qbar;

// Instantiate the Unit Under Test (UUT)
dff uut (
    .q(q), 
    .qbar(qbar), 
    .d(d), 
    .clk(clk), 
    .clear(clear)
);

initial begin
    // Initialize Inputs
    d = 1'b0;
    clk = 1'b0;
    clear = 1'b1;
    #10 clear = 1'b0;
    #7 clear = 1'b1;
end

always #2 d = d +1'b1; 

always #5 clk = ~clk;

initial $monitor("Time=%g, d=%b, clk=%b, clear=%b", $time, d, clk, clear);

initial #100 $finish;

endmodule