FROM node:21-alpine

# Install dependencies
RUN apk add --no-cache \
    git

RUN git clone https://github.com/4v3ngR/pluto_tv_scraper.git /app

WORKDIR /app

RUN npm install

RUN npm install -g .

# Add ca mapping
RUN sed -i 's/"mapping": {/"mapping": {\n\t\t"ca": "104.205.56.23",/g' /app/config.json

# Replace "outdir": ".", with "outdir": "/data/iptv", in config.json
RUN sed -i 's/"outdir": ".",/"outdir": "\/data\/iptv",/g' /app/config.json

# Add cron job (every 6 hours)
RUN echo "0 */6 * * * /usr/local/bin/pluto-tv-scraper" >> /etc/crontabs/root

CMD ["tail", "-f", "/dev/null"]