FROM jenkins/jenkins:lts-alpine

USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN \
  apk add --no-cache \
    --repository https://nl.alpinelinux.org/alpine/v3.6/community \
      docker && \

  /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt && \
  echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER jenkins
