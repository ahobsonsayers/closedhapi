FROM arranhs/closedcode:1.2.15

ARG HAPI_VERSION=0.15.4

# Install hapi
RUN bun install --global @twsxtd/hapi@$HAPI_VERSION

# Copy hapi script
COPY --chown=agent:agent ./scripts/hapi.sh /hapi.sh

EXPOSE 3006

CMD ["/hapi.sh"]
