# Kindergarten exchange

This is open source application used to help parents to communicate and organize
when they want to switch places in kindergartens.

Repository url:

https://github.com/trkin/kindergarten-exchange

It is using Rails, Tailwind, Neo4g graph database.
It requires:

* Ruby 3.2.0
* node 18.15.0

[Installation guide](https://dev.trk.in.rs/)

* PostgreSQL 14.7

```
sudo apt update
sudo apt install postgresql postgresql-contrib libpq-dev
sudo service postgresql start
psql --version
```

Change 'myuser' to 'your_name' if you get an error: `role 'your_name' does not exist`

```
sudo -u postgres psql
create user myuser with encrypted password 'mypass';
alter user myuser with superuser;
```

# Development

To run locally you should run yarn

```
git clone git@github.com:trkin/kindergarten-exchange.git
cd kindergarten-exchange
yarn
bundle
bin/setup
bin/dev
```

and you should be able to open site on http://localhost:3000/

# Database

To create database and add your user as postgresql superuser you can follow
TODO: https://github.com/trkin/dev.trk.in.rs/issues/8

# Test

TODO: https://github.com/trkin/kindergarten-exchange/issues/3

# Deployment

TODO: https://github.com/trkin/kindergarten-exchange/issues/9

