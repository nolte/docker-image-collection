#!/bin/bash
set -e

source /home/executer/.virtualenvs/usage-ansible/bin/activate
exec "$@"
