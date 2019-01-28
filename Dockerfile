FROM alpine:3.8

RUN apk add --no-cache tini busybox-extras

WORKDIR /var/www/html

ENTRYPOINT ["/sbin/tini", "-g", "--"]

COPY rootfs/ /

CMD [ "httpd", "-f", "-h", "/var/www/html", "-p", "80", "-c", "/etc/httpd.conf" ]

EXPOSE 80

HEALTHCHECK --interval=5s --timeout=1500ms --start-period=10s --retries=3 CMD ["/docker-healthcheck.sh"]
