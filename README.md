### How to run?
`docker compose up -d --build --force-recreate`

The import step will fail as keycloak tries to connect to `loclahost:5432`. However, if `"--import-realm" is passed in
the entry point, the import works.