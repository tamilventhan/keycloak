# Use Keycloak 26 base image
FROM quay.io/keycloak/keycloak:26.0.0

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# Expose HTTP port
EXPOSE 8080

# Start Keycloak using in-memory DB
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", \
  "--hostname-strict=false", \
  "--http-enabled=true", \
  "--http-relative-path=/", \
  "--hostname-url=http://0.0.0.0:8080", \
  "--proxy=edge", \
  "--proxy-headers=xforwarded"]
