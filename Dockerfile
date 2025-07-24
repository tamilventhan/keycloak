# Use Keycloak 26 base image
FROM quay.io/keycloak/keycloak:26.0.0

# Set admin credentials (these can also be overridden via Render environment variables)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build Keycloak (required for configuration changes)
RUN /opt/keycloak/bin/kc.sh build

# Expose the port Keycloak runs on
EXPOSE 8080

# Start Keycloak with updated flags
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", \
  "--hostname-strict=false", \
  "--http-enabled=true", \
  "--http-relative-path=/", \
  "--proxy-headers=forward", \
  "--hostname-url=http://0.0.0.0:8080"]
