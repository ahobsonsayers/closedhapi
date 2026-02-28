FROM arranhs/closedcode:1.1.50

ARG HAPI_VERSION=0.15.3

# Install hapi
RUN bun install --global @twsxtd/hapi@$HAPI_VERSION

# Copy hapi script
COPY ./scripts/hapi.sh /hapi.sh

EXPOSE 3006

CMD ["/hapi.sh"]
