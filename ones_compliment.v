module ones_compliment (
    input [3:0] A, B,
    input Cin,
    output [3:0] Y,
    output Cout
);

    wire [3:0] carry1;
    wire [3:0] carry2;
    wire around;

    full_adder FA0(
        .A(A[0]),
        .B(B[0]),
        .Cin(1'b0),
        .Y(Y[0])
    );



endmodule