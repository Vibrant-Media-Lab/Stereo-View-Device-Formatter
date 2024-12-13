#!/bin/bash

# Function to check and install Homebrew on macOS
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add Homebrew to PATH for Apple Silicon Macs
        if [[ $(uname -m) == 'arm64' ]]; then
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        echo "Homebrew installation completed."
    else
        echo "Homebrew is already installed."
    fi
}

install_homebrew
# Check if Python 3 is already installed
echo "Checking for Python installation"
if command -V python3 &> /dev/null; then
    echo "Python 3 is already installed."
else
    brew install python3
    echo "Python 3 has been installed."
fi
sleep 1s

# Check for pip3
if command -V pip3 &> /dev/null; then
    echo "pip3 is already installed."
else
    brew install python3
    echo "pip3 has been installed."
fi

# Verify the installation
echo "Python version:"
python3 --version
echo "pip version:"
pip3 --version
sleep 1s

# Check for ImageMagick
echo "Checking for ImageMagick binaries installation"
if command --version magick &> /dev/null; then
    echo "ImageMagick is already installed"
else
    brew install imagemagick
fi
sleep 1s

echo "Installing the dependencies for Stereo Format App"
python3 -m venv stereoformatvenv
source stereoformatvenv/bin/activate
pip3 install -r requirements.txt
sleep 1s

echo "Stereo Format setup is complete!"
echo "Deploying Stereo Device View Formatter on local"
python3 app.py