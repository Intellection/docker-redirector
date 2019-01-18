#!/bin/bash

set -eu

echo "Validating required environment variables"
: ${REDIRECT_TARGET:?"You need to set the REDIRECT_TARGET environment variable."}

# Set default redirect code
REDIRECT_CODE="${REDIRECT_CODE:=301}"

# Add http if not set
if ! [[ ${REDIRECT_TARGET} =~ ^https?:// ]]; then
	REDIRECT_TARGET="http://${REDIRECT_TARGET}"
fi

# Add trailing slash
if [[ ${REDIRECT_TARGET:(-1)} != "/" ]]; then
	REDIRECT_TARGET="${REDIRECT_TARGET}/"
fi

echo "Redirecting to ${REDIRECT_TARGET} with status code ${REDIRECT_CODE}"

cat <<EOF > /etc/nginx/conf.d/default.conf
server {
	listen 80;

  return ${REDIRECT_CODE} ${REDIRECT_TARGET}\$request_uri;
}
EOF

exec nginx -g "daemon off;"
