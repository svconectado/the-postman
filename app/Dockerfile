FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN mkdir /app

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN gem install bundler
RUN bundle install

COPY . /app