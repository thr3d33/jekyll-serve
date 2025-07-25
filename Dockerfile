FROM ruby:3.1-slim-bullseye AS jekyll
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*
# used in the jekyll-server image, which is FROM this image
COPY docker-entrypoint.sh /usr/local/bin/
RUN gem update --system && gem install jekyll && gem cleanup
EXPOSE 4000
WORKDIR /site
ENTRYPOINT [ "jekyll" ]
CMD [ "--help" ]
# build from the image we just built with different metadata
FROM jekyll AS jekyll-serve
# on every container start, check if Gemfile exists and warn if it's missing
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
