import Std.Diagnostics.*;
import Std.Math.*;
import Std.Convert.*;
import Std.Arrays.*;

operation MultipleQubitsSimpleExample(): Int {
    use qubits = Qubit[3];
    ApplyToEach(H, qubits); // useful function
    Message("The qubit register in a uniform superposition: ");
    DumpMachine();
    let result = ForEach(M, qubits);
    Message("Measuring the qubits collapses the superposition to a basis state.");
    DumpMachine();
    ResetAll(qubits);
    return BoolArrayAsInt(ResultArrayAsBoolArray(result));
}

operation MultipleQubitsComplexExample(): Int {
    use qubits = Qubit[3];
    ApplyToEach(H, qubits);
    Message("The qubit register in a uniform superposition: ");
    DumpMachine();
    mutable results = [];
    for q in qubits {
        Message(" ");
        set results += [M(q)];
        DumpMachine();
    }
    Message(" ");
    Message("Your random number is: ");
    ResetAll(qubits);
    return BoolArrayAsInt(ResultArrayAsBoolArray(results));
}

operation Main() : Unit {
    Message($"{MultipleQubitsSimpleExample()}");
    Message($"{MultipleQubitsComplexExample()}");
}