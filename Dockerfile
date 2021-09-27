FROM bitnami/owncloud:10.8.0
# should run this while the repository is in a clean state (make was not invoked before)
# as lib will contain extra local files (e.g. composer) that would cause the container to fail
COPY core /opt/bitnami/owncloud/core
COPY lib  /opt/bitnami/owncloud/lib
USER root
# set cookie samesite to lax (default), so session cookies works with redirects from tfconnect
RUN echo "owncloud_execute_occ config:system:set http.cookie.samesite --type=string --value=Lax" >> /opt/bitnami/scripts/owncloud/setup.sh
ENTRYPOINT [ "/opt/bitnami/scripts/owncloud/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/owncloud/run.sh" ]
