FROM openshift/jenkins-slave-base-centos7

MAINTAINER Ahmed Bessifi <abessifi@redhat.com>

RUN yum -y install skopeo

# Keep image clean bt resett any proxy environment variable injected automatically during build.

ENV http_proxy= https_proxy= no_proxy= HTTP_PROXY= HTTPS_PROXY= NO_PROXY=

USER 1001
