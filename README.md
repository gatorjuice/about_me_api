# About Me API

A real-ish backend project for practice and teaching of Rails APIs

![CI-CD](https://github.com/gatorjuice/about_me_api/actions/workflows/tests.yml/badge.svg)

## Running Locally

This App can be run locally in 2 easy ways. You can do traditional local Rails development or run it from a docker container with a few commands.

### `development` Mode

1. Run `bundle install`
1. Using 2 terminals, run `bundle exec sidekiq` in one and `bundle exec rails server` in the other.

### Run in `production` Locally

1. Run `RAILS_ENV=production docker-compose up --build`

## Purposes

This is not a project with any defined special purpose. It doesn't support any production frontend (yet). Instead this is meant to be a go-to safe place to try new rails features, teach through example, try out dependencies, etc. But for the sake of categorization and a halfway decent Readme, I will list out the main drivers for putting this together.

### Teaching (myself and others)

The main reason for this project is to serve as a sandbox for rails development and thus, a way to dive deeper on rails without having to set up a new project every time.

### Guilt-free Testing

I want a rails app I can put through the spin cycle and not worry about breaking something upon which people are actually depending. At the same time I want that experimentation to take place in an established system, a maintained Rails App with most if not all of the bells and whistles a standing long term project would have.

### Best Practices Enforcement

Being a full-time developer on closed-source code means that I don't have as much time to devote to open-source projects. I'd like this repo to serve as a way to reinforce best practices across the entire development cycle, from IRB to CI-CD.

> A NOTE ABOUT COMMENTS - I love Ruby for its expressive ability which generally makes limiting comments in lieu of clean, expressive code the way to go. That said, comments can help teach so I plan to have them in more places than would normally be needed.

## What this App Does

For now, this App serves as the backend for a non-existent frontend form. It is meant to capture basic user information, nothing serious. Imagine if you joined a club and they wanted you to create an account and provide some information about yourself.
