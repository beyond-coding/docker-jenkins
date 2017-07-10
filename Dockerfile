FROM jenkins:latest
MAINTAINER Guillermo Herrero <guillermo.herrero@beyond-coding.com>

ENV BASE_IMAGE=jenkins:latest

ARG APK_PACKAGES="su-exec shadow"

ARG MNT_DIR=/var/jenkins_home
ARG _USER=jenkins
ARG HOME="$MNT_DIR"
ARG TZ=Europe/Vienna
ARG JAVA_TOOL_OPTIONS="-Duser.timezone=$TZ"
ARG TERM=xterm-256color

ENV \
  MNT_DIR="$MNT_DIR" \
  _USER="$_USER" \
  HOME="$HOME" \
  TZ="$TZ" \
  JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS" \
  TERM="$TERM"

CMD ["/usr/local/bin/jenkins.sh"]

WORKDIR $HOME

USER root