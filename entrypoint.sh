#!/bin/sh

logfile=/var/log/munki-trello.log

crontab - <<-CRONJOB
$DOCKER_TRELLO_CRON_PATTERN python /munki-trello-master/munki-trello.py \
  --key "$DOCKER_TRELLO_KEY" \
  --token "$DOCKER_TRELLO_TOKEN" \
  --boardid "$DOCKER_TRELLO_BOARDID" \
  --to-dev-list "$DOCKER_TRELLO_TO_DEV_LIST" \
  --dev-list "$DOCKER_TRELLO_DEV_LIST" \
  --to-test-list "$DOCKER_TRELLO_TO_TEST_LIST" \
  --test-list "$DOCKER_TRELLO_TEST_LIST" \
  --to-prod-list "$DOCKER_TRELLO_TO_PROD_LIST" \
  --dev-catalog "$DOCKER_DEV_CATALOG" \
  --test-catalog "$DOCKER_TEST_CATALOG" \
  --prod-catalog "$DOCKER_PROD_CATALOG" \
  --repo-path "$DOCKER_TRELLO_MUNKI_PATH" \
  --prod-suffix "$DOCKER_TRELLO_SUFFIX" \
  --date-format "$DOCKER_TRELLO_DATE_FORMAT" \
  --dev-stage-days "$DOCKER_TRELLO_DEV_STAGE_DAYS" \
  --stage-test "$DOCKER_TRELLO_STAGE_TEST" \
  --test-stage-days "$DOCKER_TRELLO_TEST_STAGE_DAYS" \
  --stage-prod "$DOCKER_TRELLO_STAGE_PROD" \
  --makecatalogs /munki-master/code/client/makecatalogs >> $logfile
CRONJOB

touch $logfile
exec tail -f $logfile & $@
