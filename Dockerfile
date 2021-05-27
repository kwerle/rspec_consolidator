FROM ruby:3

WORKDIR /src/

COPY Gemfile* ./
COPY *.gemspec ./
COPY lib/rspec_consolidator/version.rb ./lib/rspec_consolidator/version.rb

RUN bundle

COPY . ./
