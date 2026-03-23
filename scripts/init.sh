#!/bin/bash
set -e

# Turn on ServiceCallIn and turn off required password change for SuperUser. Settings defined in [ merge.cpf ]
iris merge iris /irisdev/app/merge.cpf

# Init IOP
python3 -m iop --init

# Load the production defined in [ settings.py ]
python3 -m iop -m /irisdev/app/settings.py --force-local
