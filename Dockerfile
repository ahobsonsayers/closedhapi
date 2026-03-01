FROM arranhs/closedcode:1.1.50

ARG HAPI_VERSION=0.15.3

# Install hapi
RUN bun install --global @twsxtd/hapi@$HAPI_VERSION

# Copy hapi script
COPY --chown=agent:agent ./scripts/hapi.sh /hapi.sh

ENV HAPI_LISTEN_HOST 0.0.0.0
ENV HAPI_LISTEN_PORT 3006

EXPOSE 3006

CMD ["/hapi.sh"]
