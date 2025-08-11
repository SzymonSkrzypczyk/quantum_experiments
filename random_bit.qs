operation Main() : Result {
    // define a qubit 
    use q = Qubit();

    // apply H transform to put qubit into superposition
    H(q);

    // evaluate the qubit
    let res = M(q);

    // Release the qubit
    Reset(q);
    
    return res;
}