#!/bin/sh

if [ -f venv/bin/activate ]
then
    echo sourcing virtualenv...
    source venv/bin/activate
    echo done.
fi

# Thank you https://github.com/actions/bin/blob/master/sh/entrypoint.sh
for cmd in "$@"; do
    echo "Running '$cmd'..."
    if sh -c "$cmd"; then
        echo "Successfully ran '$cmd'"
    else
        exit_code=$?
        echo "Failure running '$cmd', exited with $exit_code"
        exit $exit_code
    fi
done
