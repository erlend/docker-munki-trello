FROM pebbleit/munki-trello
ENV DOCKER_TRELLO_TO_DEV_LIST="To Development" \
    DOCKER_TRELLO_DEV_LIST="Development" \
    DOCKER_TRELLO_TO_TEST_LIST="To Testing" \
    DOCKER_TRELLO_TEST_LIST="Testing" \
    DOCKER_TRELLO_TO_PROD_LIST="To Production" \
    DOCKER_TRELLO_MUNKI_PATH="/munki_repo" \
    DOCKER_TRELLO_SUFFIX="Production" \
    DOCKER_DEV_CATALOG="development" \
    DOCKER_TEST_CATALOG="testing" \
    DOCKER_PROD_CATALOG="production" \
    DOCKER_CRON="--hours=*/12"

ADD https://github.com/MasteryConnect/docker-cron/releases/download/v1.3/docker-cron /
COPY entrypoint.sh /
RUN chmod 0755 /docker-cron

ENTRYPOINT ["/entrypoint.sh"]
