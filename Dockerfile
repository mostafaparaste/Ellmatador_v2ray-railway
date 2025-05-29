# استفاده از نسخه مشخصی از v2fly-core
FROM v2fly/v2fly-core:v4.45.2

# کپی کردن فایل تنظیمات به مسیر صحیح
COPY config.json /etc/v2ray/config.json

CMD ["/usr/bin/v2ray", "run", "-config=/etc/v2ray/config.json"]
