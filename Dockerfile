FROM quay.io/keycloak/keycloak:26.0.0

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Install and build Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
