FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y wget screen libhwloc-dev libssl-dev unzip && \
    apt-get clean

WORKDIR /app

# Download and extract precompiled XMRig
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.21.1/xmrig-6.21.1-linux-x64.tar.gz && \
    tar -xvzf xmrig-6.21.1-linux-x64.tar.gz && \
    mv xmrig-6.21.1 xmrig && \
    chmod +x xmrig/xmrig

# Copy your start script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
