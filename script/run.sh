#!/bin/bash
Xvfb ":99" -ac -screen 0 "1280x1024x24" -nolisten tcp&
export DISPLAY=":99"
robot -d /output /src
#kill -9 $(pgrep Xvfb)
tail -f