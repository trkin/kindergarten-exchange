# Kindergarten exchange

This is open source application used to help parents to communicate and organize
when they want to switch places in kindergartens.

There are currently no vacancies, so when they want to move, they get an answer from the authorities: all places are filled.

They currently use FB groups and advertisements on kindergarten doors, which is not effective
![fb](https://user-images.githubusercontent.com/1426092/228525249-89967f4a-e126-4943-9ab9-5494fb7b1f40.png)

Using this app, they can easily log in using their mobile phone or email, select their current location and wishes, and wait for a notification.

## App

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

# Model

Basic models are:
* `User` email of registered user
* `Location` name and location for kindergarten
* `Group` age groups for each location
* `Wish` is Group User relation, ie current location
* `WishGroup` is Wish Group relation, ie target location

# Database

To create database and add your user as postgresql superuser you can follow
TODO: https://github.com/trkin/dev.trk.in.rs/issues/8

# Test

TODO: https://github.com/trkin/kindergarten-exchange/issues/3

# Deployment

TODO: https://github.com/trkin/kindergarten-exchange/issues/9

