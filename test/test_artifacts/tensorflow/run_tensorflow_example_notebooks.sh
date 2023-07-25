#!/bin/bash

# Create an empty notebook file for papermill's output
touch nb_output.ipynb

# List of all referenced notebook files in Basics, Core, and In Depth sections of Tensorflow docs, excluding experimentals.
# https://www.tensorflow.org/guide
example_notebooks=('tutorials/keras/classification.ipynb')

for nb in ${example_notebooks[@]}; do
     papermill $nb 'nb_output.ipynb'
done
