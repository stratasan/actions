#!/bin/sh
set -eux

if [ -f venv/bin/activate ]
then
    source venv/bin/activate
fi

# Thank you https://github.com/actions/bin/blob/master/sh/entrypoint.sh
for cmd in "$@"; do
    if sh -c "$cmd"; then
        echo "Successfully ran '$cmd'"
    else
        exit_code=$?
        echo "Failure running '$cmd', exited with $exit_code"
        exit $exit_code
    fi
done
