FROM zappi/nginx:1.19.5

COPY start.sh /usr/local/bin/

USER root
RUN apk add --update bash \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /usr/local/bin/start.sh

USER nginx:nginx
STOPSIGNAL SIGQUIT
CMD ["start.sh"]
