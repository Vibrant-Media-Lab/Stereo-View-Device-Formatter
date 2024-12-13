#!/bin/bash

# Check if Python 3 is already installed
echo "Checking for Python installation"
if command -V python3 &> /dev/null; then
    echo "Python 3 is already installed."
else
    # Update the package index
    sudo apt-get update

    # Install Python 3 and associated packages
    sudo apt-get install -y python3 python3-venv
    echo "Python 3 has been installed."
fi
sleep 1s
if command -v pip3 &> /dev/null; then
    echo "pip3 is already installed."
else
    # Install pip3
    sudo apt-get install -y python3-pip
    echo "pip3 has been installed."
fi

# Verify the installation
echo "Python version:"
python3 --version
echo "pip version:"
pip3 --version
sleep 1s

echo "Checking for ImageMagick binaries installation"
if command -v convert &> /dev/null; then
    echo "ImageMagick is already installed"
else
    sudo apt-get update
    sudo apt install imagemagick -y
fi
sleep 1s

echo "Installing the dependencies for Stereo Format App"
python3 -m venv stereoformatvenv
source stereoformatvenv/bin/activate
pip3 install -r requirements.txt
sleep 1s

echo "Stereo Format is setup is complete!"
echo "Deploying Stereo Device View Formatter on local"
python3 app.py