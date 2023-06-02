#!/bin/sh

# Testing out https://github.com/charmbracelet/gum

export GUM_INPUT_CURSOR_FOREGROUND="#FF0"
export GUM_INPUT_PROMPT_FOREGROUND="#0FF"
export GUM_INPUT_PLACEHOLDER="What's up?"
export GUM_INPUT_PROMPT="* "
export GUM_INPUT_WIDTH=80

# Uses values configured through environment variables above but can still be
# overridden with flags.
gum input
