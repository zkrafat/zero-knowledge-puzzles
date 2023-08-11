pragma circom 2.1.4;

// In this exercise , we will learn how to check the range of a private variable and prove that 
// it is within the range . 

// For example we can prove that a certain person's income is within the range
// Declare 3 input signals `a`, `lowerbound` and `upperbound`.
// If 'a' is within the range, output 1 , else output 0 using 'out'

template Num2Bits(n) {
    signal input in;
    signal output out[n];
    var bsum = 0;
    var exp2 = 1;

    for (var i = 0; i < n; i+= 1) {
        out[i] <-- (in >> i) & 1;
        out[i] * (out[i] - 1) === 0;
        bsum += out[i]*exp2;
        exp2 = exp2 + exp2;
    }

    bsum === in;
}

template IsZero() {
    signal input in;
    signal inv;
    signal output out;

    inv <-- in!=0 ? 1/in : 0;
    out <== 1 - in*inv;
    in*out === 0;
}

template IsEqual() {
    signal input x;
    signal input y;
    signal temp;
    signal output out;

    temp <== x - y;
    component isz = IsZero();
    isz.in <== temp;
    out <== isz.out;
}

template GreaterThan(n) {
    assert(n <= 252);
    signal input in[2];
    signal output out;

    component n2b = Num2Bits(n+1);

    n2b.in <== in[0] + (1 << n) - in[1];
    out <== n2b.out[n];

}


template Range() {
    // your code here
    signal input a;
    signal input lowerbound;
    signal input upperbound;
    signal output out;
    signal templ;
    signal tempu;

    assert(upperbound > lowerbound);

    // check if salary is greater than the lowerbound

    component eql = IsEqual();
    component gtl = GreaterThan(128);

    gtl.in[0] <== a;
    gtl.in[1] <== lowerbound;

    eql.x <== a;
    eql.y <== lowerbound;

    templ <== gtl.out + eql.out;

    component equ = IsEqual();
    component gtu = GreaterThan(128);

    gtu.in[0] <== upperbound;
    gtu.in[1] <== a;

    equ.x <== a;
    equ.y <== upperbound;

    tempu <== gtu.out + equ.out;

    out <== templ * tempu;


}

component main  = Range();


