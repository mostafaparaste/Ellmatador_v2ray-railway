FROM alpine:latest

# نصب پیش‌نیازها
RUN apk add --no-cache curl bash openssl

# دانلود و نصب V2Ray با روش جایگزین
RUN mkdir -p /usr/local/bin && \
    curl -L https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -o /tmp/v2ray.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ && \
    rm /tmp/v2ray.zip && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl

# کپی فایل پیکربندی
COPY config.json /usr/local/bin/config.json

# ساخت دایرکتوری لاگ
RUN mkdir -p /var/log/v2ray

CMD ["/usr/local/bin/v2ray", "run", "-config=/usr/local/bin/config.json"]
