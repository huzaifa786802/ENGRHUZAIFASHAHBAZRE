import numpy as np
import matplotlib.pyplot as plt
import math
# Character probabilities and Fano codes
characters = {
    'A': {'prob': 0.20, 'fano': '000'},
    'B': {'prob': 0.15, 'fano': '100'},
    'C': {'prob': 0.12, 'fano': '010'},
    'D': {'prob': 0.10, 'fano': '1100'},
    'E': {'prob': 0.08, 'fano': '0110'},
    'F': {'prob': 0.06, 'fano': '1010'},
    'G': {'prob': 0.05, 'fano': '001'},
    'H': {'prob': 0.05, 'fano': '1011'},
    'I': {'prob': 0.04, 'fano': '0111'},
    'J': {'prob': 0.03, 'fano': '1101'},
    'K': {'prob': 0.02, 'fano': '1111'},
    'L': {'prob': 0.10, 'fano': '1110'}
}
def calculate_entropy(characters):
    """Calculate the entropy H = -Σ(pi × log2(pi))"""
    entropy = 0
    for char, data in characters.items():
        p = data['prob']
        if p > 0:  # Avoid log(0)
            entropy -= p * math.log2(p)
    return entropy
def calculate_average_code_length(characters):
    """Calculate average code length using Fano codes"""
    avg_length = 0
    for char, data in characters.items():
        prob = data['prob']
        code_length = len(data['fano'])
        avg_length += prob * code_length
    return avg_length
def fixed_length_bits(num_chars):
    """Calculate bits needed for fixed-length encoding"""
    return math.ceil(math.log2(num_chars))
def demonstrate_variable_length_efficiency():
    """Demonstrate why variable length codes are more efficient"""
    print("=== Question 1: Why Variable Length Codes Help ===")
    print("\nFixed-length encoding:")
    fixed_bits = fixed_length_bits(12)
    print(f"- Uses {fixed_bits} bits per character (same for all)")
    print(f"- For 100 characters: {100 * fixed_bits} bits")
    print("\nVariable-length encoding example:")
    print("- Common characters (A: 20%) get shorter codes (3 bits)")
    print("- Rare characters (K: 2%) get longer codes (4 bits)")
    print("- Frequently used characters save more bits overall")
    # Example calculation for 100 characters
    total_bits_variable = 0
    for char, data in characters.items():
        expected_count = 100 * data['prob']
        bits_used = expected_count * len(data['fano'])
        total_bits_variable += bits_used
        print(f"- {char} appears ~{expected_count:.0f} times, uses {len(data['fano'])} bits each")
    print(f"\nTotal bits for 100 characters:")
    print(f"- Fixed length: {100 * fixed_bits} bits")
    print(f"- Variable length: {total_bits_variable:.0f} bits")
    print(f"- Savings: {100 * fixed_bits - total_bits_variable:.0f} bits ({((100 * fixed_bits - total_bits_variable)/(100 * fixed_bits)*100):.1f}%)")
def solve_entropy_question():
    """Calculate and explain entropy"""
    print("\n=== Question 2: Calculate Entropy ===")
    entropy = calculate_entropy(characters)
    print("Entropy calculation:")
    print("H = -Σ(pi × log2(pi))")
    total = 0
    for char, data in characters.items():
        p = data['prob']
        term = -p * math.log2(p)
        total += term
        print(f"- {char}: -{p:.2f} × log2({p:.2f}) = {term:.4f}")
    print(f"\nTotal entropy H = {entropy:.4f} bits per character")
    print(f"\nThis represents:")
    print("- The theoretical minimum average bits needed per character")
    print("- The fundamental limit for any lossless compression")
    print("- Lower entropy = more predictable data = better compression possible")
def analyze_fano_efficiency():
    """Compare Fano code efficiency to entropy limit"""
    print("\n=== Question 3: Fano Code Efficiency ===")
    entropy = calculate_entropy(characters)
    avg_fano_length = calculate_average_code_length(characters)
    print("Fano code analysis:")
    print("Character | Probability | Code   | Length | Contribution")
    print("-" * 55)
    total_contribution = 0
    for char, data in characters.items():
        prob = data['prob']
        code = data['fano']
        length = len(code)
        contribution = prob * length
        total_contribution += contribution
        print(f"    {char}     |    {prob:.2f}     | {code:4s}   |   {length}    |   {contribution:.4f}")
    print("-" * 55)
    print(f"Average code length = {avg_fano_length:.4f} bits per character")
    print(f"Theoretical entropy = {entropy:.4f} bits per character")
    efficiency = (entropy / avg_fano_length) * 100
    overhead = avg_fano_length - entropy
    print(f"\nEfficiency Analysis:")
    print(f"- Fano efficiency: {efficiency:.2f}%")
    print(f"- Overhead: {overhead:.4f} bits per character")
    print(f"- This is {overhead/entropy*100:.1f}% above the theoretical limit")
    print(f"\nInterpretation:")
    if efficiency > 95:
        print("- Excellent efficiency! Very close to theoretical limit")
    elif efficiency > 90:
        print("- Good efficiency, reasonable for practical use")
    else:
        print("- Room for improvement, consider other algorithms")
def main():
    """Run all solutions"""
    print("School Messaging App - Information Theory Analysis")
    print("=" * 50)
    # Verify probabilities sum to 1
    total_prob = sum(data['prob'] for data in characters.values())
    print(f"Verification: Total probability = {total_prob:.2f}")  
    demonstrate_variable_length_efficiency()
    solve_entropy_question()
    analyze_fano_efficiency()
    
    print("\n" + "=" * 50)
    print("Summary of Results:")
    print(f"- Entropy (theoretical minimum): {calculate_entropy(characters):.4f} bits")
    print(f"- Fano average length: {calculate_average_code_length(characters):.4f} bits")
    print(f"- Fixed length would need: {fixed_length_bits(12)} bits")
    print(f"- Fano efficiency: {(calculate_entropy(characters)/calculate_average_code_length(characters)*100):.2f}%")
if __name__ == "__main__":
    main()