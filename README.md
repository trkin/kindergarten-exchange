# Kindergarten exchange

This is open source application used to help parents to communicate and organize
when they want to switch places in kindergartens.

Repository url:

https://github.com/trkin/kindergarten-exchange

It is using Rails, Tailwind, Neo4g graph database.
It requires:

* Ruby 3.2.0
* Rails 7
* node 18.15.0
* PostgreSQL 14.7

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

# Adding custom javascript to project

Custom javascript files are linked through a following process:
    * Create custom folder under app/javascript and place your custom .js files in it
    * Go to config/importmap.rb and add the following: pin_all_from "app/javascript/custom", under: "custom"
    * Go to app/javascript/application.js file and add the following: import "./custom/kindergarten"
    * Run rails assets:precompile
    * Start server

# Database

To create database and add your user as postgresql superuser you can follow
TODO: https://github.com/trkin/dev.trk.in.rs/issues/8

# Test

TODO: https://github.com/trkin/kindergarten-exchange/issues/3

# Deployment

TODO: https://github.com/trkin/kindergarten-exchange/issues/9

