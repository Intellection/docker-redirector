FROM nginx:1.17-alpine

COPY start.sh /usr/local/bin/

RUN apk add --update bash \
	&& rm -rf /var/cache/apk/* \
	&& chmod +x /usr/local/bin/start.sh

# Fix permission issue
RUN chown -R nginx:nginx /var/cache/nginx && \
    chmod -R g+w /var/cache/nginx

USER nginx:nginx
STOPSIGNAL SIGQUIT
CMD ["start.sh"]
