FROM ruby:3.0.5

RUN apt-get update -qq && apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && apt-get autoclean && apt-get clean

#install yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install --verbose --without development test

RUN mkdir -p tmp/pids

COPY . /app