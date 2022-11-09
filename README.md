# Plaque Overflow

A simple Ruby on Rails application that allows users to ask and answer
questions.

## Required software

- Ruby 3.1.2
- PostgreSQL 14.5 or newer

## Setting up databases

Assuming that:

- PostgreSQL is installed locally
- The default 'peer' authentication mechanism is in use for local connections
- A PostgreSQL role exists with the same name as your operating system user
- Your PostgreSQL role has the `createdb` (or `superuser`) attribute

You can create and initialise the application and test databases with:

    bin/rails db:setup

## Installing dependencies

    bundle install

## Starting the application

    bin/rails server

## Running all tests

    bin/rspec
