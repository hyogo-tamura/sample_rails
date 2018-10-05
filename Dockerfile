FROM ruby:2.5.1

ENV APP_ROOT /actindi
WORKDIR $APP_ROOT

ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential \
    mysql-client \
    libpq-dev \
    apt-transport-https

# install nodejs
RUN curl -s -L git.io/nodebrew | perl - setup
ENV PATH /root/.nodebrew/current/bin:$PATH
RUN nodebrew install-binary v8.9.0
RUN nodebrew use v8.9.0

# install yarn
# https://yarnpkg.com/en/docs/install#linux-tab
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle config --global && \
    bundle config --global build.nokogiri --use-system-libraries && \
    bundle config --global jobs 4 && \
    bundle install

COPY package.json $APP_ROOT
COPY yarn.lock $APP_ROOT

RUN yarn install

COPY . $APP_ROOT
