FROM ubuntu:latest
RUN apt update && apt install -y curl unzip
RUN mkdir -p /usr/local/bin && \
    curl -L https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -o /tmp/v2ray.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ && \
    rm /tmp/v2ray.zip && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl
COPY config.json /usr/local/bin/config.json
CMD ["/usr/local/bin/v2ray", "run", "-config=/usr/local/bin/config.json"]
