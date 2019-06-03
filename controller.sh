#!/bin/bash

DATE=$(date +"%Y-%m-%d_%H%M%S")
API_ENDPOINT="https://api.o9y.soma.farm"

fswebcam --skip 15 --frames 1 --fps 10 -d /dev/video0 -s exposure=1 -s brightness=60% -s Contrast=15%  -s Gamma=50%  -p YUYV -r 1920x1080 --jpeg 80 -s Sharpness=60% -s Saturation=45% /home/matt/bell-boy/observations/$DATE.jpg
/usr/bin/python /home/matt/bell-boy/upload_observation.py > /home/matt/bell-boy/upload_log.txt
