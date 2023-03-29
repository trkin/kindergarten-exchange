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
* PostgreSQL 14.7

# Development

## DO NOT USE STANDARD RAILS S

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
* `Kindergarten` name and location for kindergarten
* `Wish` is Kindergarten User relation, ie current location with group
* `WishKindergarten` is Wish Kindergarten relation, ie target kindergarten

# Database

To create database and add your user as postgresql superuser you can follow
TODO: https://github.com/trkin/dev.trk.in.rs/issues/8

# Test

TODO: https://github.com/trkin/kindergarten-exchange/issues/3

# Deployment

TODO: https://github.com/trkin/kindergarten-exchange/issues/9

