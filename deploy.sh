#!/bin/bash

# Load environment variables from the .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found. Please create one with OUTPUT_PATH and CHECKPOINTS_PATH."
    exit 1
fi

# Check if the Docker image already exists
if [[ "$(docker images -q midi-farm-magenta 2> /dev/null)" == "" ]]; then
    echo "Building the Docker image..."
    docker build -t midi-farm-magenta .
else
    echo "Docker image already exists. Skipping build."
fi

# Check if the container is running
if [[ "$(docker ps -q -f name=midi-farm-container)" == "" ]]; then
    echo "Running the Docker container..."
    docker run -it --name midi-farm-container --rm \
    -v "${OUTPUT_PATH}:/magenta/output" \
    -v "${CHECKPOINTS_PATH}:/magenta-data/music_vae/checkpoints" \
    midi-farm-magenta bash
else
    echo "Docker container is already running."
fi

echo "Deployment complete! App is running on port 8080."
