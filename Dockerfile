FROM ruby:3

COPY . /src/

WORKDIR /src/

RUN bundle
