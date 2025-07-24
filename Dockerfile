# Use official Keycloak 26 base image
FROM quay.io/keycloak/keycloak:26.0.0

# Set Keycloak admin user (override in Render secrets if needed)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build Keycloak configuration
RUN /opt/keycloak/bin/kc.sh build

# Expose the port Keycloak will run on (Render listens on this)
EXPOSE 8080

# Start Keycloak with proxy settings for Render compatibility
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", \
  "--hostname-strict=false", \
  "--http-relative-path=/", \
  "--http-enabled=true", \
  "--proxy=edge"]
