FROM ruby:2.7.4
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/* \
&& apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/* \
&& apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /payjp_system2

ADD Gemfile /payjp_system2/Gemfile
ADD Gemfile.lock /payjp_system2/Gemfile.lock

RUN gem install bundler
RUN bundle install

# ADD . /payjp_system2

# CMD ["rails", "server", "-b", "0.0.0.0"] 