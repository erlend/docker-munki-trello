#!/bin/sh
set -e

# Run command if given (skips the rest of the script)
[ $1 ] && exec $@

# Schedule automatically if cron is not configured
if [ -z $DC_SECS ] && \
   [ -z $DC_MINS ] && \
   [ -z $DC_HOURS ] && \
   [ -z $DC_DOM ] && \
   [ -z $DC_MONTHS ] && \
   [ -z $DC_DOW ]
then
  # Generate random number between 0 and 59
  export DC_MINS=`shuf -i 0-59 -n 1`
  echo "Automatically scheduled to run $DC_MINS minutes after every hour."
fi

exec /docker-cron python /munki-trello-master/munki-trello.py \
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
  --makecatalogs /munki-master/code/client/makecatalogs
