FROM ruby:2.3.1-alpine

RUN set -ex \
        && apk add --no-cache --virtual --update libxml2-dev \
                                                 libxslt-dev \
                                                 libev-dev \
                                                 nodejs \
                                                 build-base \
                                                 sqlite-dev \
                                                 postgresql-dev

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install

RUN gem install tzinfo-data

ADD . $APP_HOME
