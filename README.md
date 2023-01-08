# [capino/musicbrainz-picard](https://github.com/Gerben-W/musicbrainz-picard)

MusicBrainz version 2.5.8
This docker is build using baseimage-gui:ubuntu-20.04-v4 from jlesage as base.

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose (recommended)

```yaml
---
version: "3"
services:
  calibre:
    image: capino/musicbrainz-picard:latest
    container_name: picard
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Berlin
    volumes:
      - /path/to/data:/config
      - /path/to/music:/music
    ports:
      - 5800:5800
      - 5900:5900
    restart: unless-stopped
```

### docker cli

```bash
docker run -d \
  --name=picard \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Berlin \
  -p 5800:5800 \
  -p 5900:5900 \
  -v /path/to/data:/config \
  -v /path/to/music:/music
  --restart unless-stopped \
  capino/musicbrainz-picard:latest
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 5800` | Picard desktop gui. |
| `-p 5900` | Picard webserver gui. |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/Berlin` | Specify a timezone to use EG Europe/London. |
| `-v /config` | Where picard should store its database and library. |
| `-v /music` | Where you store your music. |