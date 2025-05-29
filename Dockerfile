FROM alpine:latest

# نصب پیش‌نیازها
RUN apk add --no-cache curl bash unzip openssl

# دانلود و نصب V2Ray برای معماری ARM64 (متناسب با Railway)
RUN mkdir -p /usr/local/bin && \
    curl -L https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-arm64-v8a.zip -o /tmp/v2ray.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ && \
    rm /tmp/v2ray.zip && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl

# کپی فایل پیکربندی
COPY config.json /usr/local/bin/config.json

CMD ["/usr/local/bin/v2ray", "run", "-config=/usr/local/bin/config.json"]
