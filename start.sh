#!/bin/bash
set -e

echo "Starting Basic Rasa Chatbot..."
echo "Checking environment variables..."
echo "FB_VERIFY_TOKEN is set: ${FB_VERIFY_TOKEN:+YES}"

# Start Rasa server (no actions server needed for basic bot)
exec rasa run \
    --enable-api \
    --cors "*" \
    --port 5000 \
    --model models/basic-model.tar.gz