FROM ruby:2.6.5-alpine3.10

ENV LANG en_US.UTF-8
ENV PS1 '\[\033[01;34m\]\w\[\033[00m\] \[\033[01;32m\]$ \[\033[00m\]'

RUN apk add --no-cache \
  bash \
  build-base \
  nodejs \
  postgresql-client \
  postgresql-dev \
  python2 \
  tzdata \
  yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install

COPY . .
