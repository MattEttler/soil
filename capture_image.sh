#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H%M%S")

fswebcam --fps 10 -d /dev/video0 -S 2 -s focus=2 -s exposure=2 -s brightness=60% -s Contrast=15%  -s Gamma=50%  -p YUYV -r 1920x1080 --jpeg 80 -s Sharpness=60% -s Saturation=40% /home/matt/bell-boy/manual_observations/$DATE.jpg
