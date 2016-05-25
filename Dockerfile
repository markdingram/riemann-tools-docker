FROM debian

RUN apt-get update && apt-get install -y ruby ruby-dev build-essential
    zlib1g-dev && \
    gem install --no-ri --no-rdoc riemann-tools

