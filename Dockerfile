FROM owncloud/server:10.9.1
# should run this while the repository is in a clean state (make was not invoked before)
# as lib will contain extra local files (e.g. composer) that would cause the container to fail
COPY core /var/www/owncloud/core
COPY lib  /var/www/owncloud/lib
