# [capino/musicbrainz-picard](https://github.com/Gerben-W/musicbrainz-picard)

MusicBrainz version 2.5.8
This docker is build using baseimage-gui:ubuntu-20.04-v4 from jlesage as base.

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose (recommended)

```yaml
---
version: "2.1"
services:
  calibre:
    image: capino/musicbrainz-picard:latest
    container_name: picard
    security_opt:
      - seccomp:unconfined #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Berlin
      - PASSWORD= #optional
      - CLI_ARGS= #optional
    volumes:
      - /path/to/data:/config
    ports:
      - 8080:8080
      - 8081:8081
    restart: unless-stopped
```

### docker cli

```bash
docker run -d \
  --name=picard \
  --security-opt seccomp=unconfined `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Berlin \
  -e PASSWORD= `#optional` \
  -e CLI_ARGS= `#optional` \
  -p 8080:8080 \
  -p 8081:8081 \
  -v /path/to/data:/config \
  --restart unless-stopped \
  capino/musicbrainz-picard:latest
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8080` | Picard desktop gui. |
| `-p 8081` | Picard webserver gui. |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/Berlin` | Specify a timezone to use EG Europe/London. |
| `-e PASSWORD=` | Optionally set a password for the gui. |
| `-e CLI_ARGS=` | Optionally pass cli start arguments to calibre. |
| `-v /config` | Where picard should store its database and library. |
| `--security-opt seccomp=unconfined` | For Docker Engine only, many modern gui apps need this to function as syscalls are unkown to Docker. |
