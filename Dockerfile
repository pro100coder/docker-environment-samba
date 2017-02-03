FROM alpine:latest

# update the base system
RUN \
		apk update && apk upgrade && \
		apk add samba samba-common-tools supervisor && rm -rf /var/cache/apk/*

COPY smb.conf /config/smb.conf
COPY supervisord.conf /config/supervisord.conf

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
