module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
	wire carryout;
    wire [15:0] out1, out2;
    
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(out1), .cout(carryout));
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(carryout), .sum(out2), .cout());
    
    assign sum = {out2, out1};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
	assign sum = a ^ b ^ cin;
	assign cout = a & b | (a ^ b) & cin;
endmodule
