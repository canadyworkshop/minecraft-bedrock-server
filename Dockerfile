FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    unzip \
    libcurl4 \
    wget2 \
    && rm -rf /var/lib/apt/lists/* \
    && wget2 https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-1.21.114.1.zip \
    && unzip bedrock-server-1.21.114.1.zip \
    && rm -f bedrock-server-1.21.114.1.zip \
    && apt-get remove unzip -y \
    && rm -rf /var/lib/apt/lists/*

ARG LD_LIBRARY_

ARG LD_LIBRARY_PATH=.

EXPOSE 19132/udp
ENTRYPOINT [ "./bedrock_server"]
