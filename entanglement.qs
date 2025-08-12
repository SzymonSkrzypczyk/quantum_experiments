// multiqubit operation - works on more than 1 qubit at once
// CNOT(controlled not) flips state of 2nd(target qubit) qubit only if 1st(control qubit) is |1>

// Entanglement steps:
// 1. Take two qubits in the |00> state 
// 2. Create a superposition state only in the control qubit by applying H
// 3. Apply the CNOT operator to the control qubit, which is in a superposition state,
// and the target qubit, which is in the state |0>

import Std.Diagnostics.*;

operation Main() : (Result, Result) {
    use (q1, q2) = (Qubit(), Qubit());

    H(q1);
    Z(q1); // different bell state
    CNOT(q1, q2);

    DumpMachine();

    let (m1, m2) = (M(q1), M(q2));
    Reset(q1);
    Reset(q2);

    return (m1, m2);
}