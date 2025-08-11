import Std.Convert.*;
import Std.Math.*;
import Std.Intrinsic.Message;

// derived from random_bit.qs
operation GenerateRandomBit() : Result {
    use q = Qubit();
    H(q);

    let res = M(q);

    Reset(q);
    return res;
}

// generate truly random number in range
operation GetRandomNumber(max: Int) : Int {
    // list holding bits' values
    // type declaration
    mutable bitValues: Result[] = [];
    // size of number in bits
    // (type inference)
    let bitNum = BitSizeI(max);

    // looping in range
    for curBit in 1..bitNum {
        // set for adding elements to the list
        set bitValues += [GenerateRandomBit()];
    }

    // convenience function for array -> Int conversion
    let selectedNum = ResultArrayAsInt(bitValues);

    // if number is greater than max retry else return the number
    // interesting syntax for ternary operator...
    return selectedNum < max ? selectedNum | GetRandomNumber(max);
}

// ;)
@EntryPoint()
operation Main() : Int {
    let curMax = 152;
    Message($"Random number between 0 and {curMax}: ");
    return GetRandomNumber(curMax)
}