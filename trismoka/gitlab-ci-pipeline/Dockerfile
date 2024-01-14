FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get install -y openssh-client

RUN mkdir ~/.ssh && chmod 700 ~/.ssh
WORKDIR /certs
COPY monade.pem /certs/monade.pem
RUN ssh-keyscan trismoka-dokku-test.monadeapps.xyz >> /root/.ssh/known_hosts

RUN ssh -T -i "monade.pem" dokku@trismoka-dokku-test.monadeapps.xyz postgres:export postgis-database > ~/$(date +"%y%m%d%H%M").sql