FROM debian

RUN apt-get update && apt-get install -y ruby ruby-dev build-essential zlib1g-dev && \
    gem install --no-ri --no-rdoc riemann-tools -v = 0.2.11

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
