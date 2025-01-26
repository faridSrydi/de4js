FROM ruby:2.7-alpine

# Tambahkan dependencies yang diperlukan
RUN apk add --no-cache build-base gcc bash cmake git libxml2-dev libxslt-dev

# Set working directory
WORKDIR /srv/jekyll

# Salin script entrypoint
COPY docker-entrypoint.sh /usr/local/bin/

# Berikan izin eksekusi pada script
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Update RubyGems untuk mencegah masalah kompatibilitas
RUN gem update --system

# Install Bundler versi tertentu agar kompatibel
RUN gem install bundler -v '2.3.26'

# Set entrypoint
ENTRYPOINT [ "docker-entrypoint.sh" ]
