# IOP base

A basic repository for starting new IOP ([project page](https://pypi.org/project/iris-pex-embedded-python/) projects, contains one python file and one settings.py with sample production. Suggestions are always welcome.

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

> The management portal is available at [http://localhost/csp/sys/UtilHome.csp](http://localhost/csp/sys/UtilHome.csp)
> Default credentials: `SuperUser` / `SYS`

### 3. Explore available iop commands

```bash
iop -h
```

This prints the full help output for the `iop` CLI — use it to list, start, stop, and manage interoperability productions running inside IRIS.

Make sure to check out the [IOP documentation](https://grongierisc.github.io/interoperability-embedded-python) for more information and guidance.

## Known issues
The docs mention remote cli being available since version 3.6.0, yet the latest release is 3.5.5. Even though the functionality does seem to exist in this version, there is no way I'm able to get it to work. Hence I have set the version to be used to the pre-release version 3.5.6b10. This, as you can see, is still lower than version 3.6.0, yet seems to work regardless... The following issues are known, and might be a result of using the pre release version.

### Remote CLI
The -R option and the IOP_SETTINGS environment variable as mentioned in the IOP docs seem to be broken, set the following environment variables. 

```
IOP_URL=http://localhost:80
IOP_USERNAME=SuperUser
IOP_PASSWORD=SYS
```

```iop -m settings.py``` still works, since it uses the settings defined in the settings file itself.

### Starting the production
```iop -s``` seems to start the production, but crashes nonetheless, regardless of any variables or remote settings.

```
"/iop/_remote.py", line 117, in start_production_with_log
last_id = max(last_id, entry.get("id", 0))

TypeError: '>' not supported between instances of 'str' and 'int'
```

### Export with no default production
```iop -e``` without having set the default production.

```
requests.exceptions.HTTPError: 500 Server Error: Internal Server Error for url: http://localhost:80/api/iop/export?namespace=USER&production=Not set
```

Set the default production with ```iop -d [production name]```.

### ```1: start.sh not found``` during docker build

This is because windows is a nice operating system that converts line endings. Solution:

``` bash
git config core.autocrlf input
git checkout -- scripts/start.sh
```

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
