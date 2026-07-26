import numpy as np
import matplotlib.pyplot as plt
def cake_calculator(flour, sugar):
    """
    Calculate how many cakes can be made and remaining ingredients.
    Args:
        flour: Integer > 0, amount of available flour
        sugar: Integer > 0, amount of available sugar
    Returns:
        List of [cakes_made, remaining_flour, remaining_sugar]
    """
    flour_needed = 100  # Recipe requires 100 units of flour per cake
    sugar_needed = 50   # Recipe requires 50 units of sugar per cake
    # Calculate maximum cakes possible with each ingredient
    max_cakes_from_flour = flour // flour_needed
    max_cakes_from_sugar = sugar // sugar_needed
    # The limiting ingredient determines how many cakes we can make
    cakes_made = min(max_cakes_from_flour, max_cakes_from_sugar)
    # Calculate remaining ingredients after making cakes
    remaining_flour = flour - (cakes_made * flour_needed)
    remaining_sugar = sugar - (cakes_made * sugar_needed)
    return [cakes_made, remaining_flour, remaining_sugar]
# Test cases for verification
def test_cake_calculator():
    print("Testing Cake Calculator:")
    print("-" * 40)
    # Test case 1: Exact ingredients for 1 cake
    result1 = cake_calculator(100, 50)
    print(f"Input: flour=100, sugar=50")
    print(f"Output: {result1}")
    print(f"Expected: [1, 0, 0]")
    print()
    # Test case 2: Enough for multiple cakes
    result2 = cake_calculator(250, 150)
    print(f"Input: flour=250, sugar=150")
    print(f"Output: {result2}")
    print(f"Expected: [2, 50, 50]")
    print()
    # Test case 3: Sugar is limiting ingredient
    result3 = cake_calculator(1000, 75)
    print(f"Input: flour=1000, sugar=75")
    print(f"Output: {result3}")
    print(f"Expected: [1, 900, 25]")
    print()
    # Test case 4: Flour is limiting ingredient
    result4 = cake_calculator(150, 500)
    print(f"Input: flour=150, sugar=500")
    print(f"Output: {result4}")
    print(f"Expected: [1, 50, 450]")
    print()
    # Test case 5: Not enough ingredients for any cake
    result5 = cake_calculator(50, 25)
    print(f"Input: flour=50, sugar=25")
    print(f"Output: {result5}")
    print(f"Expected: [0, 50, 25]")
# Alternative implementation following the pseudocode exactly
def cake_calculator_pseudocode(flour, sugar):
    """
    Alternative implementation following the provided pseudocode exactly.
    """
    flour_needed = 100  # Recipe requires 100 flour
    sugar_needed = 50   # Recipe requires 50 sugar
    cake_count = 0      # Number of cakes made
    while True:
        if flour < flour_needed or sugar < sugar_needed:
            break  # Stop if we can't make any more cakes
        flour = flour - flour_needed
        sugar = sugar - sugar_needed
        cake_count = cake_count + 1
    flour_left = flour
    sugar_left = sugar
    return [cake_count, flour_left, sugar_left]
if __name__ == "__main__":
    # Run tests
    test_cake_calculator()
    print("\nTesting pseudocode implementation:")
    print("-" * 40)
    result = cake_calculator_pseudocode(250, 150)
    print(f"Pseudocode version result: {result}")
    print("\n" + "="*50)
    print("INTERACTIVE CAKE CALCULATOR")
    print("="*50)
    while True:
        try:
            print("\nEnter ingredient amounts (or 'quit' to exit):")
            flour_input = input("Flour amount: ").strip()
            if flour_input.lower() in ['quit', 'exit', 'q']:
                print("Thanks for using the Cake Calculator!")
                break
            flour = int(flour_input)
            sugar = int(input("Sugar amount: "))
            if flour <= 0 or sugar <= 0:
                print("Error: Amounts must be positive integers!")
                continue
            result = cake_calculator(flour, sugar)
            cakes, remaining_flour, remaining_sugar = result
            print(f"\n🎂 RESULTS:")
            print(f"   Cakes you can make: {cakes}")
            print(f"   Remaining flour: {remaining_flour}")
            print(f"   Remaining sugar: {remaining_sugar}")
            if cakes == 0:
                print("   ❌ Not enough ingredients for even one cake!")
                print(f"   Need: 100 flour (you have {flour}) and 50 sugar (you have {sugar})")
            elif remaining_flour > 0 or remaining_sugar > 0:
                print(f"   ℹ️  You have leftover ingredients!")
            else:
                print(f"   ✅ Perfect! No ingredients wasted!")
        except ValueError:
            print("Error: Please enter valid integers!")
        except KeyboardInterrupt:
            print("\n\nGoodbye!")
            break
        except Exception as e:
            print(f"An error occurred: {e}")
# Additional utility functions for competition use
def solve_multiple_test_cases():
    """
    Function to handle multiple test cases as typically required in competitions.
    """
    try:
        n = int(input("Number of test cases: "))
        results = []
        for i in range(n):
            flour, sugar = map(int, input(f"Test case {i+1} (flour sugar): ").split())
            result = cake_calculator(flour, sugar)
            results.append(result)
            print(f"Case {i+1}: {result[0]} {result[1]} {result[2]}")
        return results
    except Exception as e:
        print(f"Error processing test cases: {e}")
        return []
def validate_solution():
    """
    Comprehensive validation with edge cases.
    """
    test_cases = [
        # (flour, sugar, expected_result)
        (100, 50, [1, 0, 0]),           # Exact ingredients for 1 cake
        (250, 150, [2, 50, 50]),        # Multiple cakes possible
        (1000, 75, [1, 900, 25]),       # Sugar limiting
        (150, 500, [1, 50, 450]),       # Flour limiting
        (50, 25, [0, 50, 25]),          # Not enough for any cake
        (0, 100, [0, 0, 100]),          # No flour
        (100, 0, [0, 100, 0]),          # No sugar
        (99, 49, [0, 99, 49]),          # Just under requirements
        (300, 100, [2, 100, 0]),        # Sugar exactly consumed
        (200, 150, [2, 0, 50]),         # Flour exactly consumed
    ]
    print("COMPREHENSIVE VALIDATION:")
    print("="*60)
    all_passed = True
    for i, (flour, sugar, expected) in enumerate(test_cases, 1):
        result = cake_calculator(flour, sugar)
        passed = result == expected
        all_passed &= passed
        status = "✅ PASS" if passed else "❌ FAIL"
        print(f"Test {i:2d}: flour={flour:3d}, sugar={sugar:3d} -> {result} {status}")
        if not passed:
            print(f"Expected: {expected}")
    print("="*60)
    print(f"Overall result: {'✅ ALL TESTS PASSED' if all_passed else '❌ SOME TESTS FAILED'}")
    return all_passed