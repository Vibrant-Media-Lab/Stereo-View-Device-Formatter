# Stereo View Device Formatter

## Set Up
1. Install Python from https://www.python.org/downloads/
2. Install ImageMagick from https://imagemagick.org/script/download.php
3. Download the stereo-formatting.py and devices.txt file

## Usage
In your terminal, navigate to the folder where ```stereo-formatting.py``` and ```devices.txt``` is located.
  
### Formatting an image
```python3 stereo-formatting.py -f <path to image> "<device name>" [optional: output file name ending in .jpg]```
  
  Device names can be found in ```devices.txt``` followed by their device width, device height, effective width, and effective height. 

### Adding a device profile
```python3 stereo-formatting.py -a "<device name>" <device width> <device height> <effective width> <effective height>```
  
  or by editing ```devices.txt```
 
  Note: Devices can't have the same name. Otherwise, the device that appeared first will be overwritten.
