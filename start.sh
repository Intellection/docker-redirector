#!/bin/bash

set -eu

echo "Validating required environment variables"
: ${REDIRECT_TARGET:?"You need to set the REDIRECT_TARGET environment variable."}

# Set defaults
REDIRECT_CODE="${REDIRECT_CODE:=301}"
IGNORE_REQUEST_URI="${IGNORE_REQUEST_URI:=false}"

# Set variables
NGINX_CONFIG_FILE="/etc/nginx/conf.d/default.conf"

# Add http if not set
if ! [[ ${REDIRECT_TARGET} =~ ^https?:// ]]; then
	REDIRECT_TARGET="http://${REDIRECT_TARGET}"
fi

echo "Redirecting to ${REDIRECT_TARGET} with status code ${REDIRECT_CODE}"

if [[ ${IGNORE_REQUEST_URI} = "true" ]]; then
  cat <<- EOF > ${NGINX_CONFIG_FILE}
server {
  listen 8080;
  return ${REDIRECT_CODE} ${REDIRECT_TARGET};
}
EOF
else
  cat <<- EOF > ${NGINX_CONFIG_FILE}
server {
  listen 8080;
  return ${REDIRECT_CODE} ${REDIRECT_TARGET}\$request_uri;
}
EOF
fi

exec nginx -g "daemon off;"
