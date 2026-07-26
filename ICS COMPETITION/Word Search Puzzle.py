import numpy as np
import random
import string
def create_crossword(words):
    """
    Creates a 10x10 word search puzzle with the given words.
    Args:
        words: List of words to place in the puzzle
    Returns:
        List of lists representing the 10x10 grid
    """
    # Initialize 10x10 grid with None values
    grid = [[None for _ in range(10)] for _ in range(10)]
    # Define possible directions: (row_delta, col_delta)
    directions = [
        (0, 1),   # Horizontal right
        (0, -1),  # Horizontal left
        (1, 0),   # Vertical down
        (-1, 0),  # Vertical up
        (1, 1),   # Diagonal down-right
        (-1, -1), # Diagonal up-left
        (1, -1),  # Diagonal down-left
        (-1, 1)   # Diagonal up-right
    ]
    def can_place_word(word, row, col, direction):
        """Check if a word can be placed at given position and direction"""
        dr, dc = direction
        word_len = len(word)
        # Check if word fits within grid boundaries
        end_row = row + dr * (word_len - 1)
        end_col = col + dc * (word_len - 1)
        if not (0 <= end_row < 10 and 0 <= end_col < 10):
            return False
        # Check if positions are available or match existing letters
        for i in range(word_len):
            curr_row = row + dr * i
            curr_col = col + dc * i
            curr_cell = grid[curr_row][curr_col]
            if curr_cell is not None and curr_cell != word[i].upper():
                return False
        return True
    def place_word(word, row, col, direction):
        """Place a word in the grid at given position and direction"""
        dr, dc = direction
        word = word.upper()
        for i in range(len(word)):
            curr_row = row + dr * i
            curr_col = col + dc * i
            grid[curr_row][curr_col] = word[i]
    def get_placement_attempts():
        """Generate random placement attempts"""
        attempts = []
        for row in range(10):
            for col in range(10):
                for direction in directions:
                    attempts.append((row, col, direction))
        random.shuffle(attempts)
        return attempts
    # Sort words by length (longest first) for better placement success
    words = sorted([w for w in words if w], key=len, reverse=True)
    # Place each word in the grid
    placed_words = []
    for word in words:
        if not word or len(word) > 10:  # Skip empty or too long words
            continue
        word = word.strip().upper()
        if not word:
            continue
        placed = False
        attempts = get_placement_attempts()
        # Try to place the word
        for row, col, direction in attempts:
            if can_place_word(word, row, col, direction):
                place_word(word, row, col, direction)
                placed_words.append(word)
                placed = True
                break
        if not placed:
            print(f"Warning: Could not place word '{word}' in the grid")
    # Fill empty cells with random letters
    for row in range(10):
        for col in range(10):
            if grid[row][col] is None:
                grid[row][col] = random.choice(string.ascii_uppercase)
    return grid
def print_grid(grid):
    """Helper function to print the grid nicely"""
    for row in grid:
        print(' '.join(row))
def find_word_in_grid(grid, word):
    """Helper function to find and highlight a word in the grid"""
    word = word.upper()
    directions = [(0,1), (0,-1), (1,0), (-1,0), (1,1), (-1,-1), (1,-1), (-1,1)]
    for row in range(10):
        for col in range(10):
            for dr, dc in directions:
                if check_word_at_position(grid, word, row, col, dr, dc):
                    return (row, col, dr, dc)
    return None
def check_word_at_position(grid, word, row, col, dr, dc):
    """Check if word exists at given position and direction"""
    if not (0 <= row + dr * (len(word) - 1) < 10 and 
            0 <= col + dc * (len(word) - 1) < 10):
        return False
    for i in range(len(word)):
        if grid[row + dr * i][col + dc * i] != word[i]:
            return False
    return True
# Example usage and testing
if __name__ == "__main__":
    # Test with the example words
    test_words = ["LEARNING", "SCIENCE", "FUN"]
    print("Creating word search puzzle with words:", test_words)
    print()
    puzzle = create_crossword(test_words)
    print_grid(puzzle)
    print("\nSearching for words in the puzzle:")
    for word in test_words:
        result = find_word_in_grid(puzzle, word)
        if result:
            row, col, dr, dc = result
            direction_names = {
                (0,1): "horizontal right", (0,-1): "horizontal left",
                (1,0): "vertical down", (-1,0): "vertical up",
                (1,1): "diagonal down-right", (-1,-1): "diagonal up-left",
                (1,-1): "diagonal down-left", (-1,1): "diagonal up-right"
            }
            print(f"'{word}' found at position ({row}, {col}) going {direction_names[(dr, dc)]}")
        else:
            print(f"'{word}' not found")
    print("\n" + "="*50)
    # Test with more words
    more_words = ["PYTHON", "CODE", "ALGORITHM", "DATA", "PROGRAM"]
    print("Creating another puzzle with words:", more_words)
    print()
    puzzle2 = create_crossword(more_words)
    print_grid(puzzle2)