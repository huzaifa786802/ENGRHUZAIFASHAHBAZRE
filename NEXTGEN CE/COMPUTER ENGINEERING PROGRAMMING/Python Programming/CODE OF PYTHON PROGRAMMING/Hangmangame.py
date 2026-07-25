#Hangman Game
#Goal: Create a simple text-based Hangman game where the player guesses a word one letter at a time.
#Simplified Scope:
#● Use a small list of 5 predefined words (no need to use a file or API).
#● Limit incorrect guesses to 6.
#● Basic console input/output — no graphics or audio.
#Key Concepts Used: random, while loop, if-else, strings, lists.
import random
#Predefined list of words
words = ['python', 'engineer', 'huzaifa', 'computer', 'hangman']
#Randomly select a word from the list
secret_word = random.choice(words)
#Game variables
guessed_letters = []
attempts_left = 9
print("Welcome to Hangman!")
print("You have 9 incorrect guesses allowed.")
print("_ " * len(secret_word))
#Main game loop
while attempts_left > 0:
    guess=input("\nEnter a letter:").lower()
    #Input validation
    if len(guess)!=1 or not guess.isalpha():
        print("Please enter a single valid letter.")
        continue
    if guess in guessed_letters:
        print("You already guessed that letter.")
        continue
    guessed_letters.append(guess)
    #Check if the guess is correct
    if guess in secret_word:
        print("Good guess!")
    else:
        attempts_left -= 1
        print(f"Wrong guess!")
        print(f"Attempts left: {attempts_left}")
        #Display current progress
        display_word=""
        for letter in secret_word:
            if letter in guessed_letters:
                display_word += letter + " "
            else:
                display_word += "_ "
        print(display_word.strip())
    #Check for win condition
    if"_" not in display_word:
        print(f"Congratulations! You guessed the word: {secret_word}")
        break
    #lose condition
if attempts_left == 0:
    print(f"Sorry, you've run out of attempts. The word was: {secret_word}")