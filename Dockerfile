FROM openshift/jenkins-slave-base-centos7

MAINTAINER Ahmed Bessifi <abessifi@redhat.com>

ENV OPENSHIFT_CLIENT_VERSION=${OPENSHIFT_CLIENT_VERSION:-3.7.23}
ENV GOPASS_VERSION=${GOPASS_VERSION:-1.8.3}

# Install Skopeo for images sync
RUN yum -y install skopeo

# Install OpenShift Client CLI
RUN curl --output /tmp/oc-${OPENSHIFT_CLIENT_VERSION}.tgz https://mirror.openshift.com/pub/openshift-v3/clients/${OPENSHIFT_CLIENT_VERSION}/linux/oc.tar.gz && \
    tar -xf /tmp/oc-${OPENSHIFT_CLIENT_VERSION}.tgz -C /usr/bin/ && \
    rm -rf /tmp/oc-${OPENSHIFT_CLIENT_VERSION}.tgz

# Install gopass for secret management
RUN yum install -y gnupg2 git rng-tools && \
    wget -P /tmp/ https://github.com/gopasspw/gopass/releases/download/v${GOPASS_VERSION}/gopass-${GOPASS_VERSION}-linux-amd64.tar.gz && \
    tar -xf /tmp/gopass-${GOPASS_VERSION}-linux-amd64.tar.gz -C /tmp/ && \
    cp /tmp/gopass-${GOPASS_VERSION}-linux-amd64/gopass /usr/bin/ && \
    rm -rf /tmp/gopass-*

# Keep image clean bt resett any proxy environment variable injected automatically during build.
ENV http_proxy= https_proxy= no_proxy= HTTP_PROXY= HTTPS_PROXY= NO_PROXY=

USER 1001
