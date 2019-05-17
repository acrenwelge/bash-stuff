# Using `vim` - 5/30/19

I got started with vim from this [Youtube tutorial](https://www.youtube.com/watch?v=Nim4_f5QUxA)

## Overview

`vim` is a powerful command-line tool for text editing in UNIX systems.
Other editors include `nano`, `emacs`, and `pico`, but `vim` is by far the most powerful.

`Vim` stands for "vi"-improved - `vi` was the original UNIX editor and `vim` is its successor.

There is actually a built-in vim tutorial on the command line - just run `vimtutor`.

### Vim Modes

When working with `vim`, keep in mind there are different **modes** you can be in:

* Normal mode
* Command mode
* Insert mode
* Visual mode

It's important to know which mode you are in so you don't enter the wrong key!

When you first enter `vim`, you're in **normal** mode, so let's start with that...

### Normal Mode

If you're not in normal mode, press `ESC` to enter into it. Normal mode enables navigation of the text file,
but insertion is not allowed. 

Navigation can be done with several commands (no need to reach for arrow keys!):

* j - move down a line
* k - move up a line
* h - move left one character
* l - move right one character
* w - move forward by a "word" (stops at punctuation)
* W - move forward by a "WORD" (skips punctuation - here, words are only separated by whitespace)
* b - move backwards by a "word"
* B - move backwards by a "WORD"
* e - move to end of next "word"
* f <char> - move forward to the first appearance of <char>
* F <char> - move backward to the first appearance of <char>
* gg - move to beginning of the file
* Shift-G - move to end of the file
* 0 - move to beginning of the line
* ^ - move to beginning of the line (after leading whitespace)
* $ - move to the end of the line
* Ctrl-d - page down
* Ctrl-u - page up
* Ctrl-e - scroll down a line
* Ctrl-y - scroll up a line
* zz - recenter the screen at current line

#### Cut/Copy/Paste/Undo/Redo

In normal mode, you can manipulate text in the document using the following commands:

* x - cut a character
* dd - cut the current line
* yy - yank/copy the current line
* p - paste
* u - undo
* Ctrl-R - redo

#### Flows - Multiply Commands!

We can multiply commands to apply them more than once. The general syntax is:

<number> <verb> <noun>

For example:
* 4w  - move forward by 4 words
* 3dj - delete the next 3 lines
* 3dk - delete the previous 3 lines
* 5yw - yank next 5 words

## Command Mode

Command mode is entered from normal mode using the colon (:). Here we can send commands for vim to execute.

### Exiting Vim!

Many inexperienced vim users, including myself, have gotten lost trying to exit vim.
There's a few commands you can enter to do this:

* :q - quit (this will fail if you have made unsaved changes)
* :wq - write/save and quit
* :q! - force quit without saving

And here's a few more general commands:
* :w - write (for saving your work periodically)
* :w <file> - write to <file>
* :e <filename> - edit the file with vim

### Insert Mode

From normal mode, you can enter **insert mode** by pressing `i`. You should see something like "-- INSERT --" appear
at the bottom of the screen. Now, you are no longer entering commands - you will be inserting text into the document.

To exit back into normal mode, press `ESC`.

There are other commands similar to `i`:

* i - Enter insert mode at cursor
* I - Enter insert mode at first non-blank character
* s - Delete character under cursor and enter insert mode
* S - Delete line and begin insert at beginning of same line
* a - Enter insert mode _after_ cursor
* A - Enter insert mode at the end of the line
* o - Enter insert mode on the next line
* O - Enter insert mode on the above line
* C - Delete from cursor to end of line and begin insert

### Replacing Text 

* r <char> - replace current character under your cursor with <char>
* R - enter replace mode (text is replaced instead of inserted)

### Visual Mode

Suppose we want to select some text and manipulate it - we can use **visual mode** for that.

From normal mode, press `v`. Now, you can navigate around to select text and manipulate it using the commands we've already learned.

#### Visual blocks

We can do multi-line inserts and deletions with visual blocks

1. Press Ctrl-v to start a visual-block.
2. You can move up and down lines with j and k to select blocks. 
3. To insert text, press I (lowercase i will not work) to start insertion
4. Press ESC and your insertion appears on each line (works with deletion as well)

Also, indentation of many lines can be done easily with `>` this way. (`>>` to indent a single line in normal mode)

### Searching

To search for some text (from command mode), use a backslash `/` followed by the text to search for.

* ? - search backwards
* * - search word under cursor
* g* - search word under cursor (unbounded)
* n - next result
* N - previous result

## Misc

* % - go to matching parentheses or bracket
* ggvG - motion to select entire file

## Config

Some helpful general settings to put in .vimrc file - use :help <cmd> to look these up

set showcmd
set number 
set cursorline
set ruler
set incsearch
set wildmenu
set smartcase
set relativenumber
set expandtab
set hlsearch
syntax enable

## QUESTIONS??

