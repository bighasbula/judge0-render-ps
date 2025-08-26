#!/bin/bash
set -e

echo "=== Starting Judge0 container ==="

# 1️⃣ Start Redis in background
echo "Starting Redis..."
redis-server --daemonize yes

# 2️⃣ Run database migrations
echo "Running migrations..."
bundle exec rake db:migrate

# 3️⃣ Start Judge0 worker in background
echo "Starting Judge0 worker..."
bundle exec rake judge0:worker &

# 4️⃣ Start Rails API server
echo "Starting Rails server..."
bundle exec rails s -b 0.0.0.0 -p ${PORT:-1000}

