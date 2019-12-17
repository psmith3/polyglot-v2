# Polyglot V2 for Docker on Synology


FROM python:3.7-slim-buster

EXPOSE 3000

RUN apt-get update -y
RUN apt-get install -y npm
RUN apt-get -qqy install git wget

RUN mkdir -p /opt/udi-polyglotv2/
WORKDIR /opt/udi-polyglotv2/
RUN wget -q https://s3.amazonaws.com/polyglotv2/binaries/polyglot-v2-linux-x64.tar.gz
RUN tar -zxf /opt/udi-polyglotv2/polyglot-v2-linux-x64.tar.gz

# Run Polyglot
CMD /opt/udi-polyglotv2/polyglot-v2-linux-x64
