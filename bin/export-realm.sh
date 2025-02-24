#!/bin/bash

docker compose exec -ti keycloak bash -c "/opt/keycloak/bin/kc.sh export --file /opt/keycloak/data/import/dev-realm.json --users same_file --realm dev"
