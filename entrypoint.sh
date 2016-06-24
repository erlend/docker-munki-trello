#!/bin/sh

if [ -z $1 ]; then
  set -- /docker-cron "$DOCKER_CRON" python /munki-trello/munki-trello.py \
    --key $DOCKER_TRELLO_KEY \
    --token $DOCKER_TRELLO_TOKEN \
    --boardid $DOCKER_TRELLO_BOARDID \
    --to-dev-list "$DOCKER_TRELLO_TO_DEV_LIST" \
    --dev-list "$DOCKER_TRELLO_DEV_LIST" \
    --to-test-list "$DOCKER_TRELLO_TO_TEST_LIST" \
    --test-list "$DOCKER_TRELLO_TEST_LIST" \
    --to-prod-list "$DOCKER_TRELLO_TO_PROD_LIST" \
    --dev-catalog "$DOCKER_DEV_CATALOG" \
    --test-catalog "$DOCKER_TEST_CATALOG" \
    --prod-catalog "$DOCKER_PROD_CATALOG" \
    --repo-path "$DOCKER_TRELLO_MUNKI_PATH" \
    --suffix "$DOCKER_TRELLO_SUFFIX" \
    --makecatalogs /munki-tools/code/client/makecatalogs
fi

[ "$DEBUG" -eq 'true' ] && echo $@
exec $@
