pragma circom 2.1.4;

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template IsZero() {
    signal input in;
    signal inv;
    signal output out;

    inv <-- in!=0 ? 1/in : 0;
    out <== 1 - in*inv;
    in*out === 0;
}

template Equality() {
   // Your Code Here..
   signal input a[3];
   signal output c;
   signal temp1;
   signal temp2;

   component isz1 = IsZero();
   component isz2 = IsZero();

   temp1 <-- a[0] - a[1];
   isz1.in <== temp1;
   

   temp2 <-- a[0] - a[2];
   isz2.in <== temp2;
   
   c <== isz1.out * isz2.out;
   
}

component main = Equality();