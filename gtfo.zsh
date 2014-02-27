#!/usr/bin/env zsh

killall $@

if [ $? -eq 0 ]; then
    echo '(╯°□°)╯︵ ' $(python $HOME/.dotfiles/flip.py $@)
fi
