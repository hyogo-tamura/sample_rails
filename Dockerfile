FROM ruby:2.5.1

ENV APP_ROOT /actindi
WORKDIR $APP_ROOT

ENV LANG C.UTF-8
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get update -qq && \
    apt-get install -y build-essential \
    mysql-client \
    libpq-dev \
    nodejs \
    npm

RUN npm install -g n && \
    n stable

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle config --global && \
    bundle config --global build.nokogiri --use-system-libraries && \
    bundle config --global jobs 4 && \bundle install

COPY . $APP_ROOT
