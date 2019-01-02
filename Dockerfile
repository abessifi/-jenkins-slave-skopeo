FROM openshift/jenkins-slave-base-centos7

MAINTAINER Ahmed Bessifi <abessifi@redhat.com>

RUN yum -y install skopeo

USER 1001
