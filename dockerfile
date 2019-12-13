# Polyglot V2 for Docker on Synology


FROM debian:stretch
MAINTAINER e42

# 80 = HTTP, 443 = HTTPS, 3000 = Express server(dev), 4200 = Angular2 (dev)
EXPOSE 3000

RUN apt-get update && apt-get dist-upgrade
RUN apt-get -qqy install git python3-pip python3-dev python2.7-dev python-pip wget

RUN mkdir -p /opt/udi-polyglotv2/
WORKDIR /opt/udi-polyglotv2/
RUN wget -q https://s3.amazonaws.com/polyglotv2/binaries/polyglot-v2-linux-x64.tar.gz
RUN tar -zxf /opt/udi-polyglotv2/polyglot-v2-linux-x64.tar.gz

# Run Polyglot
CMD /opt/udi-polyglotv2/polyglot-v2-linux-x64
