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
    DC_SYNC="true"

ADD https://github.com/MasteryConnect/docker-cron/releases/download/v1.3/docker-cron /
RUN apk add -U git py-pip && \
    pip install trello && \
    git clone --depth=1 https://github.com/pebbleit/munki-trello.git && \
    git clone --depth=1 https://github.com/munki/munki.git munki-tools && \
    apk del git && \
    chmod 0755 /docker-cron && \
    rm -r /var/lib/apk
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
