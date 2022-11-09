#!/bin/bash
python3 /demoapp/server.py&
#export ROBOT_OUTDIR='/output'
#export ROBOT_RUNDIR='/src'
robot -d "$ROBOT_OUTDIR" "$ROBOT_RUNDIR"
tail -f

#docker run -it --platform linux/x86_64 -v /Users/11430568/vscode/repo/robot-docker/src:/app -v /Users/11430568/vscode/repo/robot-docker/output:/output omardcwb-robot-test-alpine-demo bash -c "python3 /demoapp/server.py & robot -d /output /app" 