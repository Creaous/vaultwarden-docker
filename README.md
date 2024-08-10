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

After rebooting, switch to the vaultwarden user by running `su - vaultwarden`.

Edit the following files to configure your setup:

- .env.vw
- .env.db
- .env.backup

Once ready, you can run `docker compose up -d` to start the containers.

## Next Steps

- Consider using firewall rules to only allow access from certain countries or IPs.
- Consider using something like Cloudflare to protect against DDoS attacks and provide SSL.
  - The firewall rules mentioned above can be set up in the Cloudflare firewall.
- Consider isolating the Alpine Linux virtual machine from the rest of your network.

## License

[MIT](/LICENSE)
