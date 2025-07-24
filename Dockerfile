# Use Keycloak 26 base image
FROM quay.io/keycloak/keycloak:26.0.0

# Set admin credentials (you can override in Render secrets too)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build the Keycloak server with current configuration
RUN /opt/keycloak/bin/kc.sh build

# Expose default HTTP port
EXPOSE 8080

# Start Keycloak server with required network and proxy settings
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", \
  "--hostname-strict=false", \
  "--http-relative-path=/", \
  "--hostname-url=http://0.0.0.0:8080", \
  "--http-enabled=true", \
  "--proxy=edge"]
