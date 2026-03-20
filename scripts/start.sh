#!/bin/bash
set -e

iris start iris

iris merge iris /irisdev/app/merge.cpf

# Install python requirements
irispython -m pip install -r /irisdev/app/requirements.txt --break-system-packages

# Init IOP
irispython -m iop --init

# Load the production defined in [ settings.py ]
irispython -m iop -m /irisdev/app/settings.py --force-local

iris stop iris quietly
