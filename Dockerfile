FROM python:3

LABEL maintainer="thomas.jaspers@codecentric.de"

#
# Let's make sure we are always having the latest version of pip installed
#
RUN python -m pip install --upgrade pip

#
# Installing the latest robot framework version
#
RUN python3 -m pip install robotframework

#
# Installing selenium2 test library
#
RUN python3 -m pip install robotframework-selenium2library
RUN python3 -m pip install selenium

CMD ["robot", "/usr/src/project/sample-0-trivial/sample-0-trivial.txt"]
