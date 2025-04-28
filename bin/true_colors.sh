#!/bin/bash

# Function to display true color gradient
function true_color_test() {
    for r in {0..255}; do
        for g in {0..255}; do
            for b in {0..255}; do
                # Print the color with RGB values
                printf "\033[48;2;%d;%d;%dm %3d,%3d,%3d \033[0m" $r $g $b $r $g $b
            done
            # Print a new line after each row of colors
            echo
        done
    done
}

# Call the true_color_test function
true_color_test
