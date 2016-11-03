docker-munki-trello
====================

Runs [grahamgilbert/munki-trello](https://github.com/grahamgilbert/munki-trello)
periodically with cron. By default the script runs once every hour, but [the
schedule can be changed](#cron)

Usage
-----

### Munki Trello

Variable                      | Description
----------------------------- | -----------------------------------------
DOCKER_TRELLO_BOARDID         | ID of your Trello board. **Required**
DOCKER_TRELLO_KEY             | Trello API key. **Required**
DOCKER_TRELLO_TOKEN           | Trello User Token. **Required**
DOCKER_TRELLO_TO_DEV_LIST     | name of 'To Development' list. Default: `To Development`
DOCKER_TRELLO_DEV_LIST        | name of 'Development' list.  Default: `Development`
DOCKER_TRELLO_TO_TEST_LIST    | name of 'To Testing' list. Default: `To Testing`
DOCKER_TRELLO_TEST_LIST       | name of 'Testing' list. Default: `Testing`
DOCKER_TRELLO_TO_PROD_LIST    | name of 'To Production' list. Default: `To Production`
DOCKER_TRELLO_SUFFIX          | suffix that will be put after the dated 'Production' lists. Default: `Production`
DOCKER_TRELLO_MUNKI_PATH      | path to Munki repository. Default: `/munki_repo`
DOCKER_TRELLO_DATE_FORMAT     | date format to use when creating. Default: `%d/%m/%y`
DOCKER_TRELLO_DEV_STAGE_DAYS  | due date for autostaging from development list. Default: `0`
DOCKER_TRELLO_STAGE_TEST      | promote packages with a due date set from the development list into the testing list. Default: `False`
DOCKER_TRELLO_TEST_STAGE_DAYS | due date for autostaging from testing list. Default: `False`
DOCKER_TRELLO_STAGE_PROD      | promote packages with a due date set from the testing list into the testing list. Default: `False`

See [grahamgilbert/munki-trello](https://github.com/grahamgilbert/munki-trello)
for more information.

### Cron

Set the `DOCKER_TRELLO_CRON_PATTERN` to change when the script is run. Default
is `0 * * * *` which runs every hour on the hour.
