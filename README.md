dzocker-munki-trello
====================

Runs [pebbleit/munki-trello](https://hub.docker.com/r/pebbleit/munki-trello)
periodically with cron. By default the script runs every 15 minutes, but [the
schedule can be changed](#cron)

Usage
-----

### Munki Trello

Variable                    | Description
--------------------------- | -----------------------------------------
DOCKER_TRELLO_BOARDID       | ID of your Trello board. **Required**
DOCKER_TRELLO_KEY           | Trello API key. **Required**
DOCKER_TRELLO_TOKEN         | Trello User Token. **Required**
DOCKER_TRELLO_TO_DEV_LIST   | name of 'To Development' list. Default: `To Development`
DOCKER_TRELLO_DEV_LIST      | name of 'Development' list.  Default: `Development`
DOCKER_TRELLO_TO_TEST_LIST  | name of 'To Testing' list. Default: `To Testing`
DOCKER_TRELLO_TEST_LIST     | name of 'Testing' list. Default: `Testing`
DOCKER_TRELLO_TO_PROD_LIST  | name of 'To Production' list. Default: `To Production`
DOCKER_TRELLO_SUFFIX        | suffix that will be put after the dated 'Production' lists. Default: `Production`
DOCKER_TRELLO_MUNKI_PATH    | path to Munki repository. Default: `/munki_repo`

See [pebbleit/munki-trello](https://github.com/pebbleit/docker-munki-trello) for
more information.

### Cron

Set one or more of the following variables to configure when the scripts is run.

Variable  | Description
--------- | -----------------------
DC_SECS   | seconds: `0-59`, `*/10`
DC_MINS   | minutes: `0-59`, `*/10`
DC_HOURS  | hours: `0-23`, `*/10`
DC_DOM    | day of month: `1-31`
DC_MONTHS | month: `1-12` or `JAN-DEC`, `*/10`
DC_DOW    | day of week: `0-6` or `SUN-SAT`
DC_SYNC   | run jobs one at a time (default), or whenever they are scheduled

See [MasteryConnect/docker-cron](https://github.com/MasteryConnect/docker-cron)
for more information.
