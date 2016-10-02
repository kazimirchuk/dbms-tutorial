#!/bin/bash -i

echo "Provisioning virtual machine..."

POSTGRES_VERSION=9.3

echo vagrant | sudo -S apt-get update
echo vagrant | sudo -S apt-get install -y libpq-dev postgresql=$POSTGRES_VERSION\*
echo vagrant | sudo -S sed -i 's@#listen_addresses@listen_addresses@' /etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf
