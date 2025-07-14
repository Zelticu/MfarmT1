FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev screen

WORKDIR /app
RUN git clone https://github.com/xmrig/xmrig.git && \
    mkdir xmrig/build && cd xmrig/scripts && ./build_deps.sh && cd ../build && \
    cmake .. -DXMRIG_DEPS=scripts/deps && make -j$(nproc)

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
