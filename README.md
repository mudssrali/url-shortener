# URL Shortener

A dead simple URL shortener implementation in Elixir

## Tasks
- [x] Create short url module
- [x] Write a server to manage `shorten/1`, `get/1`, `flush/0`, and `count/0` requests
- [x] Unit Testing

## Environment Setup
  * Install elixir `1.14.3`

To start application

  * Install dependencies with `mix deps.get`
  * Start inside IEx with `iex -S mix`

## Mix Test

Run following commands to run `tests` using `mix test` utility

> mix test

## Roadmap
- [ ] User account
- [ ] Implement url expiration
- [ ] Write clean up service
- [ ] Preserve data on database e.g. `mnesia` or `postgres`
- [ ] Create an API server
- [ ] Implement Rate Limiter
- [ ] Implement URL validation
- [ ] Unit Testing
- [ ] Dockerize
