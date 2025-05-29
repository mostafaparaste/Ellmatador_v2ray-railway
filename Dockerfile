FROM alpine:latest
RUN apk add --no-cache curl bash
RUN curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh | bash
COPY config.json /usr/local/etc/v2ray/config.json
CMD ["v2ray", "run", "-config=/usr/local/etc/v2ray/config.json"]
