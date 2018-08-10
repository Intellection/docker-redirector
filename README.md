# docker-redirector

This docker container listens on port 80 and redirects all web traffic permanently to the given target domain or URL.

## Features

* Lightweight: Uses approx. 2MB RAM on Linux
* Keeps the URL path and GET parameters
* Permanent redirect (HTTP 301)

### Paths are retained

The URL path and GET parameters are retained. That means that a request to
`http://myolddomain.net/index.php?page=2` will be redirected to
`http://mydomain.net/index.php?page=2` when `REDIRECT_TARGET=mydomain.net` is
set.

### Permanent redirects

Redirects are permanent (HTTP status code 301). That means browsers will cache
the redirect and will go directly to the new site on further requests. Also
search engines will recognize the new domain and change their URLs. This means
this image is not suitable for temporary redirects e.g. for site maintenance.

## Usage

The target domain/URL is set by the `REDIRECT_TARGET` environment variable.
Possible redirect targets include:

* domains - `mydomain.net`
* paths - `mydomain.net/my_page`
* protocols - `https://mydomain.net/my_page`

### docker

To start a container that will redirect to `mydomain.net` using the plain docker command run:

```console
$ docker run --rm -d -e REDIRECT_TARGET=mydomain.net -p 80:80 zappi/redirector
```

### docker-compose

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
      - REDIRECT_TARGET=mydomain.net
```
