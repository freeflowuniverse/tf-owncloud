# ownCloud Core

[![Build Status](https://drone.owncloud.com/api/badges/owncloud/core/status.svg?branch=master)](https://drone.owncloud.com/owncloud/core)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=owncloud_core&metric=alert_status)](https://sonarcloud.io/dashboard?id=owncloud_core)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=owncloud_core&metric=security_rating)](https://sonarcloud.io/dashboard?id=owncloud_core)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=owncloud_core&metric=coverage)](https://sonarcloud.io/dashboard?id=owncloud_core)

**[ownCloud](http://ownCloud.org) gives you freedom and control over your own data.
A personal cloud which runs on your own server.**

![](https://github.com/owncloud/screenshots/blob/master/files/sidebar_1.png)

# how to build our image
### Image guide lines
- we depend on `bitnami/owncloud` image 
`bitnami/owncloud:10-debian-10`

- Install some dependencies 
ex. git
```
apt-get install -y git
```

- Clone the repo which contains the forked owncloud code 
```
RUN git clone -b tf-owncloud-10.8.0 https://github.com/crystaluniverse/tf-owncloud.git
```
- Do your changes and copy the changed files in the correct path under `/opt/bitnami/owncloud`
```
RUN cp -rf tf-owncloud/core /opt/bitnami/owncloud/
```

- change the user to be root user
```
USER root
```


- Run again the image entry point
```
ENTRYPOINT [ "/opt/bitnami/scripts/owncloud/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/owncloud/run.sh" ]
```

image example
``` 
FROM bitnami/owncloud:10.8.0
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN git clone -b tf-owncloud-10.8.0 https://github.com/crystaluniverse/tf-owncloud.git
RUN cp -rf tf-owncloud/core /opt/bitnami/owncloud/
RUN cp -rf tf-owncloud/lib  /opt/bitnami/owncloud/
USER root
ENTRYPOINT [ "/opt/bitnami/scripts/owncloud/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/owncloud/run.sh" ]
```

### Build image
```
docker build -t repo_name/image_name:tag . 
```

### Push image
```
docker push repo_name/image_name:tag
```

## Why is this so awesome?
* :file_folder: **Access your Data** You can store your files, contacts, calendars and more on a server of your choosing.
* :package: **Sync your Data** You keep your files, contacts, calendars and more synchronized amongst your devices.
* :arrows_counterclockwise: **Share your Data** You share your data with others, and give them access to your latest photo galleries, your calendar or anything else you want them to see.
* :rocket: **Expandable with dozens of Apps** ...like Calendar, Contacts, Mail or News.
* :cloud: **All Benefits of the Cloud** ...on your own Server.
* :lock: **Encryption** You can encrypt data in transit with secure https connections. You can enable the encryption app to encrypt data on storage for improved security and privacy.
* ...

## Installation instructions
https://doc.owncloud.org/server/latest/admin_manual/installation/

## Contribution Guidelines
https://owncloud.org/contribute/

## Support
Learn about the different ways you can get support for ownCloud: https://owncloud.org/support/

## Get in touch
* :clipboard: [Forum](https://central.owncloud.org)
* :envelope: [Mailing list](https://mailman.owncloud.org/mailman/listinfo)
* :hash: [IRC channel](https://web.libera.chat/?channels=#owncloud)
* :busts_in_silhouette: [Facebook](https://facebook.com/ownclouders)
* :hatching_chick: [Twitter](https://twitter.com/ownCloud)

## Important notice on translations
Please submit translations via Transifex:
https://www.transifex.com/projects/p/owncloud/

For detailed information about translations:
https://doc.owncloud.org/server/latest/developer_manual/core/translation.html
