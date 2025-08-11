operation Main() : Result {
    // define a qubit 
    use q = Qubit();

    // apply H transform to put qubit into superposition
    H(q);

    // evaluate the qubit
    // since it's an equal superposition the chance of getting either 0 or 1 is exactly 50%  
    let res = M(q);

    // Release the qubit
    Reset(q);

    return res;
}