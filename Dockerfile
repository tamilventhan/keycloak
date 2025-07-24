FROM quay.io/keycloak/keycloak:26.0.0

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build the Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# Expose default HTTP port
EXPOSE 8080

# Start the Keycloak server
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--hostname-strict=false", "--http-relative-path=/"]
