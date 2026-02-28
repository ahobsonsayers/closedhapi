FROM arranhs/closedcode:1.1.50

ARG HAPI_VERSION=1.15.3

# Install hapi
RUN bun install --global @twsxtd/hapi@$HAPI_VERSION

# Copy hapi script
COPY ./scripts/hapi.sh /hapi.sh

CMD ["/hapi.sh"]
