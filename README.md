# Docker Compose NAS

Plan:

Productivity:
- Nextcloud for file storage, calendar, contacts, etc.
- grocy for grocery management

Entertainment:
- Jellyfin for media streaming
  - tdarr for transcoding
  - radarr, sonarr, lidarr for media management
  - prowlarr for indexer management
  - recylarr for syncing sonarr and radarr with trash guides
  - subgen for direct speech to english subtitles?
  - bazarr for subtitles?
- IPTV stuff
  - https://github.com/maddox/pluto-for-channels for pluto.tv m3u and epg generation
  - xteve for m3u and epg management
- qbittorrent for torrenting

Administration:
- authelia for ocid authentication
- Homarr for a dashboard

Networking:
- Treafik for reverse proxy and SSL management
- https://github.com/tiredofit/docker-traefik-cloudflare-companion for cloudflare dns management
- pia-wireguard for public vpn
- wg-easy server for private vpn https://github.com/wg-easy/wg-easy

Monitoring:
- autoheal for automatic container restarts
- Watchtower for automatic container updates

Maybe:

Automation:
- Home Assistant for home automation