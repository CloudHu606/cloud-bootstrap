# Cloud Bootstrap

A lightweight bootstrap tool for Ubuntu servers.

Cloud Bootstrap prepares a fresh Ubuntu server by installing essential tools and configuring a production-ready environment.

## Features

- Idempotent (safe to run multiple times)
- Official Docker installation
- Ubuntu 24.04+ support
- AMD64 / ARM64 support
- Modular architecture
- ShellCheck-friendly

## Installed Components

- Git
- curl
- jq
- tree
- Docker Engine
- Docker Compose Plugin
- UFW

## Project Structure

```
cloud-bootstrap
├── install.sh
├── lib
├── modules
├── docs
├── assets
└── README.md
```

## Usage

```bash
sudo ./install.sh
```

## Design Principles

- Install missing software only
- Never upgrade existing software automatically
- Safe to run repeatedly
- One responsibility per module

## Roadmap

### v0.1

- [x] Logger
- [x] System detection
- [x] Common helpers
- [x] Git
- [x] curl
- [x] jq
- [x] tree
- [x] Docker
- [ ] UFW

### v0.2

- CLI arguments
- Interactive menu
- Dry-run mode

### v1.0

- Node.js
- Python
- Fail2ban
- Tailscale
- Nginx

## License

MIT