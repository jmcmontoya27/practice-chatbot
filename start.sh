#!/bin/bash
set -e

echo "Starting Basic Rasa Chatbot..."

# Start Rasa server (no actions server needed for basic bot)
exec rasa run \
    --enable-api \
    --cors "*" \
    --port 5000 \
    --model models/basic-model.tar.gz