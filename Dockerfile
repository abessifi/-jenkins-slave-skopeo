FROM openshift/jenkins-slave-base-centos7

MAINTAINER Ahmed Bessifi <abessifi@redhat.com>

RUN yum -y install skopeo

ENV OPENSHIFT_CLIENT_VERSION=${OPENSHIFT_CLIENT_VERSION:-3.7.23}

RUN curl --output /tmp/oc-${OPENSHIFT_CLIENT_VERSION}.tgz https://mirror.openshift.com/pub/openshift-v3/clients/${OPENSHIFT_CLIENT_VERSION}/linux/oc.tar.gz && \
    tar -xf /tmp/oc-${OPENSHIFT_CLIENT_VERSION}.tgz -C /usr/bin/ && \
    rm -rf /tmp/oc-${OPENSHIFT_CLIENT_VERSION}.tgz

# Keep image clean bt resett any proxy environment variable injected automatically during build.
ENV http_proxy= https_proxy= no_proxy= HTTP_PROXY= HTTPS_PROXY= NO_PROXY=

USER 1001
