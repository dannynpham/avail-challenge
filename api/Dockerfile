FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y postgresql-client yarn
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV BUNDLER_VERSION=2.1.4
RUN gem install bundler -v ${BUNDLER_VERSION}
RUN bundle _${BUNDLER_VERSION}_ install
#RUN yarn install --check-files

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]