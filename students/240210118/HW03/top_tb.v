module top_tb;
wire clk;
reg reset;
wire cout_unit;
wire cout_ten;
wire [9:0] q_unit;
wire [9:0] q_ten;
wire carry_ten;
wire gnd;

clk_gen u_clk_gen(clk);
assign carry_ten = ~cout_unit;      // 个位 9->0 时 cout_unit 由高变低，
                                    // 取反后产生上升沿，作为十位的时钟
assign gnd = 1'b0;                  // 两级都不禁止计数

cd4017 u_units(clk,reset,gnd,cout_unit,q_unit);
cd4017 u_tens (carry_ten,reset,gnd,cout_ten,q_ten);

initial
begin
    $dumpfile("wave.vcd");          // 波形文件，GTKWave 打开
    $dumpvars();
    reset = 1;                      // 上电复位，两位都清 0
    #20  reset = 0;                 // 开始计数
    #380 $finish();                 // 400 结束
end
endmodule
