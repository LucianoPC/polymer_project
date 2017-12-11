FROM node:slim

RUN apt-get update
RUN apt-get install -y git --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN npm install -g bower polymer-cli --unsafe-perm

RUN mkdir /usr/src/app/
WORKDIR /usr/src/app/

EXPOSE 8081
ENTRYPOINT bower install --allow-root && polymer serve -H 0.0.0.0
