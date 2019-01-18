# Changelog

## 1.1.0

* Enable configuration of redirect status code via `REDIRECT_CODE` environment variable.
* Upgrade to Nginx 1.15.
* Improve performance by using `return` instead of `rewrite`.
* Improve shutdown time using `exec`.

## 1.0.0

* Initial working release. Forked from 9a44be5 on MorbZ/docker-web-redirect.
