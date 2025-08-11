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
operation GetRandomNumber(min: Int, max: Int) : Int {
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
    return selectedNum < max and selectedNum > min ? selectedNum | GetRandomNumber(min, max);
}

// ;)
@EntryPoint()
operation Main() : Int {
    let curMin = 30;
    let curMax = 152;
    Message($"Random number between {curMin} and {curMax}: ");
    return GetRandomNumber(curMin, curMax)
}