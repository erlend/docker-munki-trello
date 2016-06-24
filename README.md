docker-munki-trello-daemon
==========================

Adds [MasteryConnect/docker-cron](https://github.com/MasteryConnect/docker-cron)
to [pebbleit/munki-trello](https://hub.docker.com/r/pebbleit/munki-trello).

Usage
-----

The script runs once every 12 hours, but can be changed with the `DOCKER_CRON`
variable.

```
docker run [OTHER ARGS] -e DOCKER_CRON=--minutes=*/15 erlend/munki-trello-daemon
```
