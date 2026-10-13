module ones_compliment (
    input [3:0] A, B,
    output [3:0] Y, ApB
);

    wire [3:0] carry1;
    wire [3:0] carry2;
    wire around;

    genvar i,j;

    generate
        full_adder FA0_1(
            .A(A[0]),
            .B(B[0]),
            .Cin(1'b0),
            .Y(ApB[0]),
            .Cout(carry1[0])
        );        

        for (i=1; i<4; i=i+1) begin
            full_adder adder1(
                .A(A[i]),
                .B(B[i]),
                .Cin(carry1[i-1]),
                .Y(ApB[i]),
                .Cout(carry1[i])
            );
        end

        assign around = carry1[3];

        full_adder FA0_2(
                .A(ApB[0]),
                .B(1'b0),
                .Cin(around),
                .Y(Y[0]),
                .Cout(carry2[0])
            );

        for (j=1; j<4; j=j+1) begin
            full_adder adder2(
                .A(ApB[j]),
                .B(1'b0),
                .Cin(carry2[j-1]),
                .Y(Y[j]),
                .Cout(carry2[j])
            );
        end
    endgenerate
endmodule