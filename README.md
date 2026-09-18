# Tic Tac Toe (Ruby)

A command-line implementation of the classic Tic Tac Toe game, built as part of **The Odin Project** Ruby curriculum. Two human players can play against each other directly in the terminal, taking turns until a winner is decided or the game ends in a draw.

## Features

* **Object-Oriented Programming (OOP):** Structured using clean separation of concerns across different classes (`Game`, `Board`, and `Player`).
* **Input Validation:** Ensures players can only select valid positions (numbers 1 through 9) that are not already occupied.
* **Dynamic Turn Management:** Automatically alternates turns between Player 1 ("X") and Player 2 ("O").
* **Win and Draw Detection:** Evaluates all possible winning combinations after each move to declare a winner or recognize a tie ("cat's game").

## Prerequisites

Make sure you have **Ruby** installed on your system. You can check your version by running:

```bash
ruby -v
```

## How to Run

1. Clone or download this repository.
2. Open your terminal in the project directory.
3. Run the game file using Ruby:

## Built With

- Ruby
- Object-Oriented Design principles (Classes, Instances, and Encapsulation)

## Project Learnings

This project helped reinforce core programming concepts such as:

* Managing game loops using `loop do`.
* Using arrays to represent a 3x3 board grid.
* Applying algorithms to check win conditions (`any?` and `all?` enumerables).



