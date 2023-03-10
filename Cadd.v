module CLA(a, b, res, cin, cout);

    input [3:0] a, b;
    input cin;
    output cout;
    output [3:0] res;
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;

    and (g0, a[0], b[0]);
    and (g1, a[1], b[1]);
    and (g2, a[2], b[2]);
    and (g3, a[3], b[3]);
    
    xor (p0, a[0], b[0]);
    xor (p1, a[1], b[1]);
    xor (p2, a[2], b[2]);
    xor (p3, a[3], b[3]);

    and(w1, p0, cin);
    or(carry0, g0, w1);

    and(w2, p1, p0, cin);
    and(w3, p1, g0);
    or(carry1, w2, w3, g1);

    and(w4, p2, p1, p0, cin);
    and(w5, p2, p1, g0);
    and(w6, p2, g1);
    or(carry2, w4, w5, w6, g2);

    and(w7, p3, p2, p1, p0, cin);
    and(w8, p3, p2, p1, g0);
    and(w9, p3, p2, g1);
    and(w10, p3, g2);
    or(cout, w7, w8, w9, w10, g3);

    xor(res[0], p0, cin);
    xor(res[1], p1, carry0);
    xor(res[2], p2, carry1);
    xor(res[3], p3, carry2);
endmodule


