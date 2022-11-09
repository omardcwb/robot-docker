FROM --platform=linux/x86_64 alpine

RUN apk add bash py-pip chromium 
#xvfb

RUN python3 -m pip install --upgrade pip
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
RUN webdrivermanager chrome
#WORKDIR /demoapp
#COPY demoapp/ ./