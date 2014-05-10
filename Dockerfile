FROM ubuntu:13.10
MAINTAINER Girish Ramakrishnan <girish@forwardbias.in>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install nodejs npm
RUN apt-get clean

ADD . /app/code

WORKDIR /app/code
RUN npm install --production

EXPOSE 7777

# Used by node-config to load config/docker.json
ENV NODE_ENV docker

# This is set in config/docker.json
VOLUME [ "/app/data" ]

ENTRYPOINT ["nodejs"]
CMD [ "server.js"]

