FROM alpine:latest

ARG URL="https://downloads.rclone.org/rclone-current-linux-arm.zip"
ENV RCLONE_OPTS="--config /config/rclone.conf"
ENV RCLONE_SOURCE="onedrive-michael:temp/"
ENV CRON="45 14 * * *"

RUN apk -U add ca-certificates fuse wget tzdata \
  && rm -rf /var/cache/apk/*

RUN cd /tmp \
  && wget -q $URL \
  && unzip ./*.zip \
  && rm rclone-current-linux-arm.zip \
  && cd * \
  && mv ./rclone /usr/bin \
  && cd /tmp \
  && rm -r /tmp/rclone*

ADD entrypoint.sh /entrypoint.sh
ADD run.sh /run.sh

VOLUME ["/config"]
VOLUME ["/data"]

ENTRYPOINT ["/entrypoint.sh"]