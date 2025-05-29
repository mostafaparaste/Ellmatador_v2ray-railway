FROM alpine:3.18

RUN apk add --no-cache --update \
    curl \
    unzip \
    openssl

RUN mkdir -p /usr/local/bin && \
    curl -L https://cdn.jsdelivr.net/gh/v2fly/v2ray-core@latest/releases/download/v5.7.0/v2ray-linux-64.zip -o /tmp/v2ray.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl && \
    rm -f /tmp/v2ray.zip

COPY config.json /usr/local/bin/config.json

CMD ["/usr/local/bin/v2ray", "run", "-config=/usr/local/bin/config.json"]
