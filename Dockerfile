FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /library

COPY Gemfile /library/Gemfile
COPY Gemfile.lock /library/Gemfile.lock
COPY bin/ /library/bin/

RUN gem install bundler -v '1.17.3'
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]