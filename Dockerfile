FROM --platform=linux/x86_64 ubuntu:bionic
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y python3-pip software-properties-common
RUN add-apt-repository -y ppa:chromium-team/dev
COPY chromium-browser-apt-preferences .
RUN mv chromium-browser-apt-preferences /etc/apt/preferences.d/chromium-browser
RUN apt-get install -y chromium-browser
RUN python3 -m pip install --upgrade pip
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
RUN webdrivermanager chrome
WORKDIR /demoapp
COPY demoapp/ ./
