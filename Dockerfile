FROM python:3.9

# Install python3-venv
RUN apt-get update && apt-get install -y python3-venv

# Set working directory
WORKDIR /app

