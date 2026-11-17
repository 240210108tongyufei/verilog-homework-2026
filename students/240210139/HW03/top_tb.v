`timescale 1ns/1ps

// top_tb.v
// HW03 测试程序：实例化 clk_gen 与两个 cd4017，实现两位十进制计数器
// 个位 u_units 由时钟直接驱动，计数 0~9 循环；
// 个位计数到 9 时 cout 输出高电平，取反后作为十位 u_tens 的 inhibit，
// 使十位在个位每次回绕时加 1，实现逢十进一。

module top_tb;
	wire clk;
	reg reset;
	reg inhibit;

	// 个位
	wire units_cout;
	wire [9:0] units_q;

	// 十位
	wire tens_cout;
	wire [9:0] tens_q;

	// 激励信号模块
	clk_gen u_clk(clk);

	// 个位计数器
	cd4017 u_units(clk, reset, inhibit, units_cout, units_q);

	// 十位计数器：个位 cout 取反后作为十位 inhibit
	cd4017 u_tens(clk, reset, !units_cout, tens_cout, tens_q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial
	begin
		reset = 1;
		inhibit = 0;
		#15 reset = 0;
		#1985 $finish;
	end
endmodule
