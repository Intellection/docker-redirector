# Changelog

## 2.1.0

* Upgrade nginx to 1.19.5.

## 2.0.0

* Change base image to `zappi/nginx` which enables running as unprivileged user `nginx`.
* Remove permission fix as these are in the base image.
* Use port `8080` instead of `80`.

## 1.5.0

* Set `STOPSIGNAL` to `SIGQUIT`.
* Remove unnecessary `EXPOSE`.
* Change `user:group` to `nginx:nginx`.
* Fix permission issue.

## 1.4.0

* Change group  to `nobody` instead of `nogroup`.

## 1.3.0

* Run as user `nobody` and group `nogroup` instead of `root`.

## 1.2.1

* Avoid adding trailing slash.

## 1.2.0

* Enable ability to ignore request URIs to support absolute redirection.
* Upgrade to Nginx 1.17.

## 1.1.0

* Enable configuration of redirect status code via `REDIRECT_CODE` environment variable.
* Upgrade to Nginx 1.15.
* Improve performance by using `return` instead of `rewrite`.
* Improve shutdown time using `exec`.

## 1.0.0

* Initial working release. Forked from 9a44be5 on MorbZ/docker-web-redirect.
