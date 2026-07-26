import numpy as np
import math
def nand(a, b):
    """
    NAND gate: outputs 0 only when both inputs are 1
    Truth table:
    a | b | NAND(a,b)
    0 | 0 |    1
    0 | 1 |    1  
    1 | 0 |    1
    1 | 1 |    0
    """
    return 1 - (a * b)  # Equivalent to: not (a and b)
def not_gate(a):
    """
    NOT gate constructed using NAND
    NOT(a) = NAND(a, a)
    Proof:
    - If a = 0: NAND(0,0) = 1 = NOT(0) ✓
    - If a = 1: NAND(1,1) = 0 = NOT(1) ✓
    """
    return nand(a, a)
def and_gate(a, b):
    """
    AND gate constructed using NAND
    AND(a,b) = NOT(NAND(a,b)) = NAND(NAND(a,b), NAND(a,b))
    Proof:
    - If a=0, b=0: NAND(0,0)=1, NOT(1)=0 = AND(0,0) ✓
    - If a=0, b=1: NAND(0,1)=1, NOT(1)=0 = AND(0,1) ✓  
    - If a=1, b=0: NAND(1,0)=1, NOT(1)=0 = AND(1,0) ✓
    - If a=1, b=1: NAND(1,1)=0, NOT(0)=1 = AND(1,1) ✓
    """
    temp = nand(a, b)
    return not_gate(temp)
def or_gate(a, b):
    """
    OR gate constructed using NAND
    OR(a,b) = NOT(AND(NOT(a), NOT(b))) (De Morgan's Law)
           = NAND(NOT(a), NOT(b))
           = NAND(NAND(a,a), NAND(b,b))
    Proof using De Morgan's Law:
    OR(a,b) = NOT(NOT(a) AND NOT(b))
    """
    not_a = not_gate(a)
    not_b = not_gate(b)
    return nand(not_a, not_b)
def print_truth_table(func, name, inputs=2):
    """Print truth table for a given function"""
    print(f"\nTruth Table for {name}:")
    if inputs == 1:
        print("a | output")
        print("--|-------")
        for a in [0, 1]:
            result = func(a)
            print(f"{a} |   {result}")
    else:
        print("a | b | output")
        print("--|---|-------")
        for a in [0, 1]:
            for b in [0, 1]:
                result = func(a, b)
                print(f"{a} | {b} |   {result}")
def verify_gates():
    """Verify that our NAND-based gates produce correct truth tables"""
    print("=== VERIFICATION OF BASIC GATES ===")
    print_truth_table(nand, "NAND")
    print_truth_table(not_gate, "NOT (using NAND)", 1)
    print_truth_table(and_gate, "AND (using NAND)")
    print_truth_table(or_gate, "OR (using NAND)")
def xor_gate(a, b):
    """
    XOR gate constructed using NAND gates only
    XOR(a,b) = OR(AND(a, NOT(b)), AND(NOT(a), b))
    This demonstrates building more complex functions
    """
    not_a = not_gate(a)
    not_b = not_gate(b)
    term1 = and_gate(a, not_b)
    term2 = and_gate(not_a, b)
    return or_gate(term1, term2)
def majority_gate(a, b, c):
    """
    3-input majority gate using NAND gates only
    Returns 1 if majority of inputs are 1
    MAJ(a,b,c) = OR(AND(a,b), OR(AND(a,c), AND(b,c)))
    """
    ab = and_gate(a, b)
    ac = and_gate(a, c)
    bc = and_gate(b, c)
    ac_or_bc = or_gate(ac, bc)
    return or_gate(ab, ac_or_bc)
def demonstrate_complex_functions():
    """Demonstrate building complex Boolean functions using only NAND"""
    print("\n=== COMPLEX FUNCTIONS BUILT FROM NAND ===")
    print_truth_table(xor_gate, "XOR (using only NAND)")
    print("\nTruth Table for 3-input MAJORITY (using only NAND):")
    print("a | b | c | output")
    print("--|---|---|-------")
    for a in [0, 1]:
        for b in [0, 1]:
            for c in [0, 1]:
                result = majority_gate(a, b, c)
                print(f"{a} | {b} | {c} |   {result}")
def count_nand_gates():
    """Count how many NAND gates are needed for each basic operation"""
    print("\n=== NAND GATE COUNT ANALYSIS ===")
    print("NOT gate: 1 NAND gate")
    print("AND gate: 2 NAND gates (NAND + NOT)")
    print("OR gate:  3 NAND gates (2 NOTs + 1 NAND)")
    print("XOR gate: 9 NAND gates total")
    print("3-input MAJORITY: 13 NAND gates total")
def theoretical_proof():
    """Print the theoretical proof of functional completeness"""
    print("\n=== THEORETICAL PROOF OF FUNCTIONAL COMPLETENESS ===")
    print("""
THEOREM: NAND is functionally complete.
PROOF:
A set of Boolean operators is functionally complete if it can express 
any Boolean function. It's sufficient to show that NAND can implement
a functionally complete set of operators.
We know that {AND, OR, NOT} is functionally complete because:
1. Any Boolean function can be expressed in Disjunctive Normal Form (DNF)
2. DNF uses only AND, OR, and NOT operations
3. Therefore, if we can build AND, OR, NOT from NAND, then NAND is complete
CONSTRUCTION:
1. NOT(a) = NAND(a, a)                    [1 NAND gate]
2. AND(a,b) = NOT(NAND(a,b))             [2 NAND gates]  
3. OR(a,b) = NAND(NOT(a), NOT(b))        [3 NAND gates]
VERIFICATION:
- NOT: ✓ (verified in truth table)
- AND: ✓ (verified in truth table)  
- OR:  ✓ (verified in truth table)
Since {AND, OR, NOT} ⊆ {functions expressible by NAND}, 
and {AND, OR, NOT} is functionally complete,
therefore NAND is functionally complete. QED
PRACTICAL IMPLICATIONS:
- Any digital circuit can be built using only NAND gates
- This is why NAND is called a "universal gate"
- NAND gates are also easy to manufacture in hardware
    """)
def main():
    """Main function demonstrating NAND functional completeness"""
    print("FUNCTIONAL COMPLETENESS OF NAND GATE")
    print("=" * 50)
    # Verify basic gates work correctly
    verify_gates()
    # Show complex functions can be built
    demonstrate_complex_functions()
    # Analysis of gate counts
    count_nand_gates()
    # Theoretical proof
    theoretical_proof()
    print("\n=== CONCLUSION ===")
    print("✓ NAND gate is functionally complete")
    print("✓ Any Boolean function can be constructed using only NAND gates")
    print("✓ This makes NAND a 'universal gate' in digital logic")
if __name__ == "__main__":
    main()