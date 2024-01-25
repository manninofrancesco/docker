#Mònade Project
#This is a Dockerfile for a ruby application that needs puppeteer so it needs nodejs
#gets the docker image of ruby 3 and lets us build on top of that
FROM --platform=linux/amd64 ruby:3.2.2-slim 

RUN apt-get update -qq && apt-get upgrade -y

#install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libcurl4-openssl-dev shared-mime-info

#install git
RUN apt-get install -y git curl default-libmysqlclient-dev

#create a folder /app in the docker container and go into that folder
RUN mkdir /app
WORKDIR /app

#install node
ARG NODE_VERSION=18.12.1
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/home/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH

RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /home/
RUN npm install puppeteer

#CLEANUP
RUN \
  apt-get autoremove -y && \
  apt-get autoclean && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Run bundle install to install gems inside the gemfile
RUN bundle install --without development test

#Create folder for pids
RUN mkdir -p tmp/pids

#Copy the whole app
COPY . /app

#Miss che CMD command in order to start the container instead of kill immediately after creation