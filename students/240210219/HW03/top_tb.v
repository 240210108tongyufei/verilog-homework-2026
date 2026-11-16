module top_tb;
	wire clk;
	reg reset;
	reg inhibit;
	wire clk_tens;
	wire cout_unit;
	wire cout_tens;
	wire [9:0] q_unit;
	wire [9:0] q_tens;
	wire unit0,unit1,unit2,unit3,unit4,unit5,unit6,unit7,unit8,unit9;
	wire tens0,tens1,tens2,tens3,tens4,tens5,tens6,tens7,tens8,tens9;
	
	clk_gen u_clk(clk);
	cd4017 u_cd4017_unit(clk,reset,inhibit,cout_unit,q_unit);
	cd4017 u_cd4017_tens(clk_tens,reset,inhibit,cout_tens,q_tens);
	assign clk_tens=~cout_unit;
	
	led u_unit0(q_unit[0],unit0);
	led u_unit1(q_unit[1],unit1);
	led u_unit2(q_unit[2],unit2);
	led u_unit3(q_unit[3],unit3);
	led u_unit4(q_unit[4],unit4);
	led u_unit5(q_unit[5],unit5);
	led u_unit6(q_unit[6],unit6);
	led u_unit7(q_unit[7],unit7);
	led u_unit8(q_unit[8],unit8);
	led u_unit9(q_unit[9],unit9);
	
	led u_tens0(q_tens[0],tens0);
	led u_tens1(q_tens[1],tens1);
	led u_tens2(q_tens[2],tens2);
	led u_tens3(q_tens[3],tens3);
	led u_tens4(q_tens[4],tens4);
	led u_tens5(q_tens[5],tens5);
	led u_tens6(q_tens[6],tens6);
	led u_tens7(q_tens[7],tens7);
	led u_tens8(q_tens[8],tens8);
	led u_tens9(q_tens[9],tens9);
	
	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		reset=1;
		inhibit=0;
		#25 reset=0;
		#980 inhibit=1;
		#100 inhibit=0;
		#1020 $finish();
	end
endmodule
