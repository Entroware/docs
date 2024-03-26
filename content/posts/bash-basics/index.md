---
title: "Bash Programming Basics"
date: 2024-03-21
description: "Introduction to Bash scripting for beginners."
summary: "This article provides an overview of Bash scripting basics, covering essential concepts and commands to get started with writing scripts in the Bash shell."
tags: ['Bash', 'Programming', 'Scripting', 'Linux', 'Shell']
aliases: 
  - /bash-basics/
---

## Introduction to Bash Programming

Bash (Bourne Again SHell) is a popular command-line shell and scripting language used primarily in Unix-like operating systems such as Linux, FreeBSD, and macOS. It provides a powerful interface for interacting with the operating system, automating tasks, and writing scripts to streamline workflows.

### Getting Started

To begin writing Bash scripts, all you need is a text editor and a basic understanding of the command-line. Bash scripts can either be executed directly from the command-line or from a dedicated file that typically use a `.sh` file extension.

### Writing Your First Script

Let's create a simple Bash script that prints "Hello, World!" to the terminal.


```bash
#!/usr/bin/env bash

# This is a comment
echo "Hello, World!"
```

In this example the first line contains `#!/usr/bin/env bash` which is an important line that specifies the interpreter to be used for executing this script.

The next line starts with a hash symbol (`#`), this is a code comment and the bash interpreter knows to ignore this and not execute it.  ﻿A code comment is typically a line of text that provides an explanation about what the code.

The final line starts with the command `echo` which prints the text that you provide it to the screen.


Save this script to a file named `hello.sh`, make it executable using `chmod +x hello.sh`, and then execute it by running `./hello.sh` in the terminal.

### Variables

Variables in Bash and can hold strings, integers, or arrays. Here's how you declare and use variables:

```bash
#!/usr/bin/env bash

# Define a variable
name="John"

# Access the variable
echo "Hello, $name!"
```

### Conditional Statements

Bash supports conditional statements for decision-making in scripts for this the `if`, `elif`, and `else` keywords are used. Here's an example where we check if the age specified in the `age` variable is greater than or equal to `18`:

```bash
#!/usr/bin/env bash

age=25

if [ $age -ge 18 ]; then
    echo "You are an adult."
else
    echo "You are a minor."
fi
```

### Loops

Loops allow you to iterate over lists of items and perform repetitive tasks. Bash supports `for` loops and `while` loops.

Here's an example of a `for` loop that will execute for each value provided. It starts with the initial value "apple" assigned to the variable `fruit`, then `echo "I like $fruit"` is then executed, which prints "I like apple".  Then it moves on to the next item in the list (banana), assigns its value to the `fruit` variable, and executes the same command again: `echo "I like $fruit"`, printing "I like banana".  It continues this process with the last fruit in the list, orange, finally resulting in the message "I like orange" being printed.


```bash
#!/usr/bin/env bash

# Iterate over a list
for fruit in apple banana orange; do
    echo "I like $fruit"
done
```

### Functions

Functions allow you to modularise your code by defining reusable blocks of commands. Here's how you define and use a function in Bash.

First we define the function `greet()` that will execute the commands inside its block when invoked.  Inside the function, there's only one command: `echo "Hello, $1!"`. This line prints a message where `$1` represents the first argument passed to the function.
We then call the function with `greet "Alice"` which will execute the `echo` command inside the `greet()` function with the string "Alice" as its argument. The output of running this script would be: `Hello, Alice!`.


```bash
#!/usr/bin/env bash

# Define a function
greet() {
    echo "Hello, $1!"
}

# Call the function
greet "Alice"
```

### Conclusion

This article has covered the basics of Bash scripting, including writing simple scripts, using variables, conditional statements, loops, and functions. With these fundamentals, you can start automating tasks and writing more complex scripts to enhance your productivity on the command line. Explore further documentation and tutorials to deepen your understanding of Bash programming.
