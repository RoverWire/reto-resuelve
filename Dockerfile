FROM ruby:2.4.10-alpine

RUN apk --no-cache add build-base zlib-dev libressl-dev libffi-dev coreutils yaml-dev linux-headers autoconf

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem update --system && gem install bundle
RUN bundle install

COPY . .
CMD ["rackup"]
