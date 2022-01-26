FROM owncloud/server:10.9.1
# should run this while the repository is in a clean state (make was not invoked before)
# as lib will contain extra local files (e.g. composer) that would cause the container to fail
COPY core /var/www/owncloud/core
COPY lib  /var/www/owncloud/lib
# ------------------------------------------------------------------------
# ensure samesite cookie is not strict
# otherwise, tfconnect won't work as cookies won't be available on redirects from tfconnect website
# hence the state won't be correct
ENV OWNCLOUD_HTTP_COOKIE_SAMESITE=Lax