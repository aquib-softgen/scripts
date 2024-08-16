#!/usr/bin/python

import sys
import os
from PIL import Image


if not os.path.exists(sys.argv[1]):
    raise Exception("File does not Exists")


filename, extension = sys.argv[1].split(".")
    
image = Image.open(sys.argv[1])

outfile = ""

halve_times = 1

if len(sys.argv) > 2:
    halve_times = int(sys.argv[2])

for i in range(0, halve_times):
    x, y = image.size

    x = x / 2
    y = y / 2

    image = image.resize((int(x), int(y)))

    new_filename = filename + "_halved" + "." + extension

    if (len(outfile)==0):
        outfile = new_filename

    image.save(new_filename)

x, y = image.size
print(f"image resized to {x}x{y}, saved to {outfile}")
