#!/bin/sh

set -eux

args="--check"

if [ -f ./pyproject.toml ]
then
    args="$args --config pyproject.toml"
fi

echo "Running black $args ."

black $args .
