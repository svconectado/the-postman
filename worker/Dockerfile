FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN mkdir /worker

WORKDIR /worker

COPY Gemfile /worker/Gemfile
COPY Gemfile.lock /worker/Gemfile.lock

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN gem install bundler
RUN bundle install

COPY . /worker