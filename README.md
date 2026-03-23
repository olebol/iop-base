# IOP base

A basic repository for starting new IOP ([project page](https://pypi.org/project/iris-pex-embedded-python/)) projects, contains one python file and one settings.py with sample production. Suggestions are always welcome.

---

## Prerequisites

- Python 3.10+
- Docker (Engine) & Docker Compose

---

## Setup

### 1. Create a virtual environment and install dependencies

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### 2. Start the IRIS Health container

```bash
docker compose up --build -d
```

This builds the image from the local `Dockerfile`, starts IRIS Health, applies the CPF merge configuration, and initialises the `iop` interoperability framework inside the container.

> The management portal is available at [http://localhost:52773/csp/sys/UtilHome.csp](http://localhost:52773/csp/sys/UtilHome.csp)
> Default credentials: `SuperUser` / `SYS`

### 3. Migrate any changes to your production

```bash
iop -m settings.py
```

Fully remote CLI is still in the works and will be included in IOP release 3.6, until then, we can only migrate remotely. If you want access to the other commands, you can use a host mounted volume and set up docker exec commands to run iop commands in the container.

Make sure to check out the [IOP documentation](https://grongierisc.github.io/interoperability-embedded-python) for more information and guidance.

---

## Ports

| Port    | Description                                  |
| ------- | -------------------------------------------- |
| `1972`  | IRIS superserver (ObjectScript / native API) |
| `52773` | IRIS web gateway / management portal         |

---

## Useful commands

```bash
# View container logs
docker compose logs -f

# Stop the container
docker compose down

# Re-enter the venv after a new shell
source .venv/bin/activate
```