module top_tb;
	wire clk;
	reg reset;
	wire cout_low;
	wire cout_high;
	wire [9:0] q_low;
	wire [9:0] q_high;

	clk_gen u_clk_gen(clk);
	cd4017 u_low(clk,reset,1'b0,cout_low,q_low);
	cd4017 u_high(cout_low,reset,1'b0,cout_high,q_high);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0,top_tb);
		reset=1'b1;
		#40 reset=1'b0;
		#2000 $finish;
	end
endmodule
