FROM ruby:2.5.1
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
ENV INSTALL_PATH /blog_rubyonrails_guide
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile ./
ENV BUNDLE_PATH /gems
COPY . .
