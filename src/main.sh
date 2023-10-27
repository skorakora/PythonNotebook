#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"




file_name="$SCRIPT_DIR/initialized.txt"



# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Installing..."
    sudo apt update
    sudo apt install python3
else
    echo "Python 3 is already installed."
fi




virtualenv $SCRIPT_DIR/venv

source $SCRIPT_DIR/venv/bin/activate



if [ -e "$file_name" ]; then

    echo "All deps met, initializing..."


else
    echo "Installing required deps..."

    pip install jupyterlab

    touch "$file_name"
fi






# Start Jupyter Lab in the background
python -m jupyter lab


# Deactivate the virtual environment
deactivate
