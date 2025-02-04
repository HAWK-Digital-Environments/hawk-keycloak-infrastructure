ARG KEYCLOAK_VERSION=15.0.2
FROM alpine:latest AS builder
RUN apk add curl
RUN mkdir -p /opt/downloads
RUN curl -L -o /opt/downloads/hawk-auth-server-extension.jar \
    https://github.com/HAWK-Digital-Environments/hawk-keycloak-auth-server/releases/latest/download/hawk-auth-server-extension.jar

ARG KEYCLOAK_VERSION
FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}
COPY --from=builder --chown=keycloak:keycloak /opt/downloads/hawk-auth-server-extension.jar /opt/keycloak/providers/hawk-auth-server-extension.jar
RUN /opt/keycloak/bin/kc.sh build
