FROM alpine:3.5

RUN apk add --no-cache tar wget ca-certificates
RUN wget "https://caddyserver.com/download/linux/amd64?plugins=${plugins}" -O - | tar -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && /usr/bin/caddy -version

COPY Caddyfile.template entrypoint.sh /

EXPOSE 80 443
ENV SITE "http://localhost"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/caddy", "--conf", "/etc/Caddyfile", "--log", "stdout"]

