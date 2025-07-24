# Use Keycloak 26 base image
FROM quay.io/keycloak/keycloak:26.0.0

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Allow dynamic port configuration for Render compatibility
ENV PORT=8080

# Build Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# Expose the dynamic port
EXPOSE ${PORT}

# Start Keycloak using in-memory H2 database
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", \
  "--hostname-strict=false", \
  "--http-enabled=true", \
  "--http-relative-path=/", \
  "--hostname=0.0.0.0:${PORT}", \
  "--proxy=edge", \
  "--proxy-headers=xforwarded", \
  "--optimized"]
