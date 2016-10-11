#!/bin/bash -i
POSTGRES_VERSION=9.3

apt-get update
apt-get install -y libpq-dev postgresql=$POSTGRES_VERSION\*
sed -i 's@#listen_addresses@listen_addresses@' /etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf

sh -c "echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale"
#apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
#echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
#apt-get update
#apt-get install -y mongodb-org
