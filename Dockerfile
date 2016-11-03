FROM alpine:3.4
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
    DOCKER_TRELLO_TO_DEV_LIST="To Development" \
    DOCKER_TRELLO_TO_TEST_LIST="To Testing" \
    DOCKER_TRELLO_TO_PROD_LIST="To Production" \
    DOCKER_TRELLO_DATE_FORMAT="%d/%m/%y" \
    DOCKER_TRELLO_DEV_STAGE_DAYS="0" \
    DOCKER_TRELLO_STAGE_TEST="False" \
    DOCKER_TRELLO_TEST_STAGE_DAYS="0" \
    DOCKER_TRELLO_STAGE_PROD="False" \
    DOCKER_TRELLO_CRON_PATTERN="0 * * * *"

RUN apk add -U curl py-pip dcron && \
    pip install trello && \
    curl -L https://github.com/grahamgilbert/munki-trello/archive/master.tar.gz | tar zx && \
    curl -L https://github.com/munki/munki/archive/master.tar.gz | tar zx && \
    apk del curl && \
    rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-f"]
