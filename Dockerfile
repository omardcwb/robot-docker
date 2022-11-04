FROM --platform=linux/x86_64 alpine

WORKDIR /app

RUN apk add bash py-pip firefox xvfb
RUN python3 -m pip install --upgrade pip

COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
RUN webdrivermanager firefox:v0.30.0

#RUN addgroup -S xxx && adduser -S xxx -G xxx
#USER xxx
#WORKDIR /home/xxx
#COPY run.sh .
CMD ["bash","run.sh"]