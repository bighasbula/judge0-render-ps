FROM ruby:2.7-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      nodejs \
      npm \
      redis-server \
      sqlite3 \
      git \
      curl \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy Gemfile
COPY Gemfile* ./
RUN gem install bundler && bundle install

# Copy the entire Judge0 repo
COPY . .

# Create SQLite folder
RUN mkdir -p db

# Disable JWT auth
ENV ENABLE_AUTH=false

# Expose Render port
EXPOSE ${PORT:-1000}

# Startup script
CMD ["./docker-entrypoint.sh"]

