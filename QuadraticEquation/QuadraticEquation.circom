pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";

// Create a Quadratic Equation( ax^2 + bx + c ) verifier using the below data.
// Use comparators.circom lib to compare results if equal

template QuadraticEquation() {
    signal input x;     // x value
    signal input a;     // coeffecient of x^2
    signal input b;     // coeffecient of x 
    signal input c;     // constant c in equation
    signal input res;   // Expected result of the equation
    signal output out;  // If res is correct , then return 1 , else 0 .

    signal temp1;
    signal temp2;
    signal sol;

    temp1 <== b*x + c; 
    temp2 <== x*x;

    sol <== a*temp2 + temp1;

    component eq = IsEqual();

    eq.in[0] <== sol;
    eq.in[1] <== res;

    out <== eq.out;

}

component main  = QuadraticEquation();



