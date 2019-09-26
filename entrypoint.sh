#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

if [ RAILS_ENV -eq "development" ]
then
    export DB_USERNAME = docker
    export DB_PASSWORD = docker
    export DB_HOST = localhost
elif [ RAILS_ENV -eq "test" ]
then
    export DB_USERNAME = docker
    export DB_PASSWORD = docker
    export DB_HOST = 13.13.13.13
elif [ RAILS_ENV -eq "production" ]
then
    export DB_USERNAME = docker
    export DB_PASSWORD = docker
    export DB_HOST = 13.13.13.13
fi


# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"