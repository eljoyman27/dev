#!/bin/bash
# Activate venv
source ./venv/bin/activate

python -m ensurepip --upgrade
# Upgrade pip and essential build tools
python -m pip install --upgrade pip setuptools wheel

# Install all dependencies
python -m pip install -r requirements.txt
