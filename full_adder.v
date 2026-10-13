module full_adder(
    input A, B, Cin,
    output Cout, Y
);

    assign Y = (A & ~B & ~Cin) || (~A & ~B & Cin) || (A & B & Cin) || (~A & B & ~Cin);
    assign Cout = (B & Cin) + (A & Cin) + (A & B);

endmodule