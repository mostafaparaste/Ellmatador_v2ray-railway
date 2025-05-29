# استفاده از نسخه مشخصی از v2fly-core
FROM v2fly/v2fly-core:v4.45.2

# کپی کردن فایل تنظیمات به مسیر صحیح
COPY config.json /etc/v2ray/config.json

# تعیین entrypoint برای اجرای v2ray
ENTRYPOINT ["/usr/bin/v2ray", "-config=/etc/v2ray/config.json"]
