FROM jenkins/jenkins:lts-alpine

USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN \
  apk add --no-cache \
    --repository http://nl.alpinelinux.org/alpine/edge/community \
      docker && \

  /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt && \
  echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

USER jenkins
