FROM pebbleit/munki-trello
ENV DOCKER_CRON="--hours=*/12"
ADD https://github.com/MasteryConnect/docker-cron/releases/download/v1.3/docker-cron /
COPY entrypoint.sh /
RUN chmod 0755 /docker-cron

ENTRYPOINT ["/entrypoint.sh"]
