FROM ruby:3.0.0

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  postgresql-client \
  libpq-dev \
  yarn \
  git \
  tzdata \
  curl \
  nodejs \
  make \
  openssl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENV BUNDLE_PATH /gems

COPY package.json ./
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000
