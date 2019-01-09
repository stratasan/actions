FROM python:3.6-slim

LABEL com.github.actions.name="Python Scripts"
LABEL com.github.actions.description="Run a list of shell commands with python3.6"
LABEL com.github.actions.icon="activity"
LABEL com.github.actions.color="blue"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
