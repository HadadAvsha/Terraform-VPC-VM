#!/bin/bash
curl -fsSL https://test.docker.com -o test-docker.sh && \
sudo sh test-docker.sh && \
sudo usermod -aG docker $USER && \
newgrp docker