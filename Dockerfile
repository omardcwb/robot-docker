FROM --platform=linux/x86_64 alpine

WORKDIR /app

RUN apk add bash py-pip firefox xvfb
#
# Let's make sure we are always having the latest version of pip installed
#
RUN python3 -m pip install --upgrade pip
#
# Installing the latest robot framework version & Installing selenium test library
#
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
#RUN python3 -m pip install robotframework
#RUN python3 -m pip install robotframework-seleniumlibrary
#RUN python3 -m pip install selenium

#RUN addgroup -S chrome && adduser -S chrome -G chrome
#USER chrome
#WORKDIR /home/chrome

#COPY run.sh .
CMD ["bash","run.sh"]