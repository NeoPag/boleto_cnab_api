FROM ruby:2.5

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y ghostscript && \
    apt-get clean

ADD . /workspace
WORKDIR /workspace
RUN bundle install && mkdir -p tmp log
EXPOSE 9292

# NOTE uncomment to --bind option to listen outside of the Docker container
CMD bundle exec puma config.ru --bind=tcp://0.0.0.0:9292
