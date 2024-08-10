# Vaultwarden Docker

Runs Vaultwarden using Docker Compose with the following containers:

- [Vaultwarden](https://hub.docker.com/r/vaultwarden/server)
- [PostgreSQL](https://hub.docker.com/_/postgres)
- [Postgres Backup Local](https://hub.docker.com/r/prodrigestivill/postgres-backup-local)

## Usage

The setup script targets Alpine Linux. Install curl using `apk add curl`, then run:

```bash
curl -L https://raw.githubusercontent.com/Creaous/vaultwarden-docker/main/setup.sh | sh
```

This script will create the vaultwarden user, install docker and docker compose, clone this repository to that user's home directory, and mount an NFS volume to the `backup-data` directory in the home directory.
