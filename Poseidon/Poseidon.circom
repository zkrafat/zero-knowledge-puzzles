pragma circom 2.1.4;
include "../node_modules/circomlib/circuits/poseidon.circom";


// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {
   // Your Code here.. 
   signal input a;
   signal input b;
   signal input c;
   signal input d;
   signal output out;

   signal temp[4];

   temp[0] <== a;
   temp[1] <== b;
   temp[2] <== c;
   temp[3] <== d;

   component pos = Poseidon(4);

   pos.inputs <== temp;

   out <== pos.out;
}

component main = poseidon();