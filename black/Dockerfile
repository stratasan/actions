FROM python:3.6-slim

LABEL version="1.0.0"
LABEL repository="http://github.com/stratasan/actions"
LABEL homepage="http://github.com/stratasan/actions/tree/master/black"
LABEL maintainer="Stratasan Developers <dev@stratasan.com>"
LABEL com.github.actions.name="Black Check"
LABEL com.github.actions.description="Verifies python files match Black formatting"
LABEL com.github.actions.icon="file"
LABEL com.github.actions.color="gray-dark"

RUN pip install black

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
