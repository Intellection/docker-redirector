# Docker Redirector

Listens on port `80` and redirects all web traffic to a given target.

## Features

* Lightweight. Uses approximately 2MB of memory.
* Keeps the URL path and parameters by default, but can be configured to be ignored.
* Supports permanent and temporary redirects.

## Usage

The redirect target is set by the `REDIRECT_TARGET` environment variable.

Possible redirect targets include:

* Domains e.g. `example.com`
* Paths e.g. `example.com/page`
* Domain with protocol e.g. `https://example.com/page`

### Absolute Redirects

By default, redirects will include the request path. This means that if your `REDIRECT_TARGET` is `example.com/specific/page` and you hit the redirector with a path of `/other/page`, you would be redirected to `example.com/specific/page/other/page`.

To redirect to a specific target without including the request path, you can set `IGNORE_REQUEST_URI` to `true`. In this case you would be redirected to `example.com/specific/page` regardless of the request path.

### Temporary Redirects

By default redirects are permantent. To change the default status code you can set `REDIRECT_CODE`. For example, to support temporary redirects you can set `REDIRECT_CODE` to `302`.

### Docker

To start a container that will redirect to `example.com` using the plain docker command run:

```console
$ docker run --rm -d -e REDIRECT_TARGET=example.com -p 80:80 zappi/redirector
```

### Docker Compose

To start a container that will permanently redirect to `example.com`, run:

```yaml
---
version: '3'
services:
  redirect:
    image: zappi/redirector
    ports:
      - 80
    environment:
      REDIRECT_TARGET: "example.com"
      REDIRECT_CODE: "302"
```
