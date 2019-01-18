## Skopeo Jenkins Slave Image

This repository contains Dockerfile to build a Jenkins Slave Docker image which is intended for use with OpenShift v3 and that embed [Skopeo](https://github.com/containers/skopeo) to manipulate Docker images without having the Docker daemon running.

The built image will include:

- Skopeo tool for images sync
- OpenShift Client

## Building the image

You can use the `openshift/build-image-template.yaml` OpenShift template to quickly build and push the `jenkins-slave-skopeo` image into your internal registry.

```
$ oc process -f openshift/build-image-template.yaml -p OPENSHIFT_CLIENT_VERSION=3.11.66 | oc create -f -
```

The template creates a `BuildConfig` and `ImageStream` objects. The BuildConfig is not triggered automatically after creation.

```
$ oc get all -l app=jenkins-slave-skopeo

NAME                                TYPE      FROM
buildconfigs/jenkins-slave-skopeo   Docker    Git@master


NAME                                DOCKER REPO                                                            TAGS
imagestreams/jenkins-slave-skopeo   docker-registry.default.svc:5000/<project-name>/jenkins-slave-skopeo   latest
```

Installed by default:

- The latest version of Skopeo from the default yum repository.
- The OpenShift `v3.7.23` but can be changed to another version when excecuting the template.

```
$ oc process -f openshift/build-image-template.yaml -p OPENSHIFT_CLIENT_VERSION=3.11.66 | oc create -f -
```



