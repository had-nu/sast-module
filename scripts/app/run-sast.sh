#!/bin/bash
docker build -t sast-toolkit .
docker run --rm \
    -v "$(pwd)/src:/app/src" \
    -v "$(pwd)/config:/app/config" \
    sast-toolkit