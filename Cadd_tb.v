module CLA_tb();

    reg [3:0] a, b;
    reg cin;
    wire [3:0] res;
    wire cout;

    CLA uut(.a(a), .b(b), .res(res), .cin(cin), .cout(cout));

    initial begin
        $dumpfile("CLA.vcd");
        $dumpvars(0, CLA_tb);
        a = 4'b0;
        b = 4'b0;
        cin = 1'b0;

        #300 $finish;
    end

    always #1 a = a+1;
    always #16 b = b+1;
    
    initial begin
        $monitor("time = %0t, a = %b, b = %b, cin = %b, res = %b, cout = %b", $time, a, b, cin, res, cout);
    end
endmodule