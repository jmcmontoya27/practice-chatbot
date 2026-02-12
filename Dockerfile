FROM python:3.9-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1

# Install minimal system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy configuration files
COPY config.yml config.yml
COPY domain.yml domain.yml
COPY credentials.yml endpoints.yml /app/
COPY data /app/data

# Train the model
RUN rasa train --fixed-model-name basic-model

# Copy startup script
COPY start.sh start.sh
RUN chmod +x /app/start.sh

EXPOSE 5000

CMD ["/app/start.sh"]