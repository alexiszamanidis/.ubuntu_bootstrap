#!/bin/bash

mv ~/.zsh_history ~/.zsh_history_bad
strings -eS ~/.zsh_history_bad > ~/.zsh_history
fc ~/.zsh_history
rm ~/.zsh_history_bad

exit 0
