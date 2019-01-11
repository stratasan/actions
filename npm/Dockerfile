FROM node:10-alpine

LABEL version="1.0.0"
LABEL repository="http://github.com/stratasan/actions"
LABEL homepage="http://github.com/stratasan/actions/tree/master/npm"
LABEL maintainer="Stratasan Developers <dev@stratasan.com>"
LABEL com.github.actions.name="NPM Script Runner"
LABEL com.github.actions.description="Run shell commands with NPM nearby"
LABEL com.github.actions.icon="activity"
LABEL com.github.actions.color="blue"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
