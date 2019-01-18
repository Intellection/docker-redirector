# Docker Redirector

This docker container listens on port 80 and redirects all web traffic permanently to the given target domain or URL.

## Features

* Lightweight. Uses approx. 2MB RAM on Linux.
* Keeps the URL path and GET parameters.
* Configurable status code (301 by default).

## Usage

The target domain/URL is set by the `REDIRECT_TARGET` environment variable.
Possible redirect targets include:

* Domains i.e. `mydomain.net`
* Paths i.e. `mydomain.net/my_page`
* Protocols i.e. `https://mydomain.net/my_page`

By default redirects are permantent. To change the default status code you can set `REDIRECT_CODE`. For example, to support temporary redirects you can set `REDIRECT_CODE` to `302`.

### Docker

To start a container that will redirect to `mydomain.net` using the plain docker command run:

```console
$ docker run --rm -d -e REDIRECT_TARGET=mydomain.net -p 80:80 zappi/redirector
```

### Docker Compose

To start a container that will redirect `myolddomain.net` to `mydomain.net`, run:

```yaml
---
version: '3'
services:
  redirect:
    image: zappi/redirector
    ports:
      - 80
    environment:
      REDIRECT_TARGET: "mydomain.net"
      REDIRECT_CODE: "302"
```
