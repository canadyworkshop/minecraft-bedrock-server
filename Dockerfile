FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    unzip \
    libcurl4 \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.60.04.zipp \
    && unzip bedrock-server-1.19.60.04.zip \
    && rm -f bin-linux/bedrock-server-1.19.60.04.zip \
    && apt-get remove unzip -y \
    && rm -rf /var/lib/apt/lists/*

ARG LD_LIBRARY_

ARG LD_LIBRARY_PATH=.

EXPOSE 19132/udp
ENTRYPOINT [ "./bedrock_server"]
