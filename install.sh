#!/usr/bin/env bash

chmod +x matching.sh
# Create the necessary directories and files:
mkdir -p $HOME/.config/matching/ $HOME/.local/share/matching/ 
touch $HOME/.local/share/matching/hiscores.txt

echo -e "# Text editor to open config file.
PREFERRED_EDITOR=${EDITOR-nano}

# Number of different colors (and consequently different cells) appearing in the game.
# Acceptable values: min 3, max 7
COLORS=7

# Theme of the cells. Acceptable values: letters, numbers, greek, shapes, faces, blocks.
THEME=faces

# Width of the matrix. Acceptable values: min 5, max 15
WIDTH=8

# Height of the matrix. Acceptable values: min 5, max 15
HEIGHT=8

# Times the matrix will be reshuffled during a game when they are no moves left.
RESHUFFLE=3

# Keys to move cursor around the matrix.
# Acceptable values for navigation keys: vim, aswd.
# Arrow keys are hardcoded and work in all options.
NAVIGATION_KEYS=vim">$HOME/.config/matching/matching.config

echo -e "***************************************\nmatching.sh has been made executable\nand the user can run it with\n\e[33m$ ./matching.sh\e[m\nfrom the matching/ directory.\n***************************************"
