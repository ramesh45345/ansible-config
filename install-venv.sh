#!/bin/bash

set -e

SCRIPTSOURCE="${BASH_SOURCE[0]}"
FLWSOURCE="$(readlink -f "$SCRIPTSOURCE")"
SCRIPTDIR="$(dirname "$FLWSOURCE")"
SCRNAME="$(basename $SCRIPTSOURCE)"
echo "Executing ${SCRNAME}."

if [ -d "$1" ]; then
	VENVPATH="$1"
else
	VENVPATH="$SCRIPTDIR"
fi

PYENV_PATH="$(readlink -f "$VENVPATH/ansible-exe")"

# Create venv.
if [ -d "$PYENV_PATH" ]; then
	python3 -m venv --upgrade ansible-exe
else
	python3 -m venv ansible-exe
fi
# Activate venv
. "$PYENV_PATH/bin/activate"
# Install ansible in venv
pip list
pip install --upgrade pip wheel setuptools
pip install --upgrade ansible
pip list
ansible-galaxy collection install -U community.general
