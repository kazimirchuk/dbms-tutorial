#!/bin/bash -i
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/countries.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/cities.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/districts.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/buildings.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/criminal_group_types.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/criminal_groups.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/persons.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/persons_enemies.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/persons_allies.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/persons_criminal_groups.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/super_abilities.sql
PGPASSWORD='15011992' psql -h localhost -d superhumans -U root -p 5432 -a -q -f /home/vagrant/dumps/persons_super_abilities.sql
