#!/bin/bash
python3 /demoapp/server.py&
robot -d /output /src
tail -f