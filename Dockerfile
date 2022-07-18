# Keycloak builder
FROM quay.io/keycloak/keycloak:18.0.1 as kc-builder
WORKDIR /opt/keycloak

COPY realm-export.json data/import/realm-export.json
RUN bin/kc.sh build  --db postgres

# Runtime container
FROM quay.io/keycloak/keycloak:18.0.1

COPY --from=kc-builder /opt/keycloak/ /opt/keycloak/

WORKDIR /opt/keycloak

# this fails
#RUN bin/kc.sh import --file data/import/realm-export.json --override=true

# adding "--import-realm" here works
CMD ["start-dev"]
