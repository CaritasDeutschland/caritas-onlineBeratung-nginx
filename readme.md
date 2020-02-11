# Nginx

## Decisions

Tool: https://github.com/npryce/adr-tools

1. [Record architecture decisions](doc/architecture/decisions/0001-record-architecture-decisions.md)
2. [Log rotation for nginx](doc/architecture/decisions/0002-log-rotation-for-nginx.md)

## logrotate configuration

The configuration file `nginx-logroate` for lograte is placed in the hosts filesystem and mounted into the docker container.

The permissions for the configuration file have to be `640` (owner root, no permission for the world). Otherwise lograte will skip the execution.