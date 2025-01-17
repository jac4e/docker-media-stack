FROM node:21-alpine

# Install dependencies
RUN apk add --no-cache \
    git \
    uuidgen

RUN git clone https://github.com/4v3ngR/pluto_tv_scraper.git /app

WORKDIR /app

RUN npm install

RUN npm install -g .

# Add ca mapping
RUN sed -i 's/"mapping": {/"mapping": {\n\t\t"ca": "104.205.56.23",/g' /app/config.json

# Replace "outdir": ".", with "outdir": "/data/iptv", in config.json
RUN sed -i 's/"outdir": ".",/"outdir": "\/data\/iptv",/g' /app/config.json

# Replace: "clientID": "00000000-0000-0000-0000-000000000000"
# with random UUID in config.json
RUN sed -i 's/"clientID": "00000000-0000-0000-0000-000000000000"/"clientID": "'$(uuidgen)'"/g' /app/config.json

# Add cron job for plutotv-scraper (every hour) (working dir: /app)
RUN echo "0 * * * * cd /app && /usr/local/bin/plutotv-scraper" > /etc/crontabs/root

# Run cron
CMD ["crond", "-f", "-d", "8"]