FROM ubuntu:22.04

# تنظیم متغیرهای محیطی برای جلوگیری از prompts
ENV DEBIAN_FRONTEND=noninteractive

# به‌روزرسانی و نصب بسته‌ها با راهکارهای جایگزین
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update -o Acquire::Check-Valid-Until=false -o Acquire::AllowInsecureRepositories=true && \
    apt-get install -y --allow-unauthenticated \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# دانلود V2Ray (نسخه مناسب برای معماری x86_64)
RUN mkdir -p /usr/local/bin && \
    curl -L https://ghproxy.com/https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -o /tmp/v2ray.zip && \
    unzip /tmp/vray.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl && \
    rm -f /tmp/v2ray.zip

# کپی فایل پیکربندی
COPY config.json /usr/local/bin/config.json

CMD ["/usr/local/bin/v2ray", "run", "-config=/usr/local/bin/config.json"]
