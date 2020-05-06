FROM centos:centos8

MAINTAINER Mohammed Fadin <m.fadin@ibm.com>

ENV PRODUCT="jboss-eap-7.3.0"  \
    JBOSS_USER="jboss"  \
    ADMIN_USER="admin" \
    ADMIN_PASSWORD="admin123admin" \
    JAVA_HOME="/usr/lib/jvm/jre-1.8.0-openjdk" \
    JBOSS_HOME="/labs/installation-files/jboss-eap-7.3"

WORKDIR /labs

ADD ./labs/jboss-eap-7.3.0.zip ./installation-files/

RUN  yum update -y && \
    yum install -y unzip && \ 
    yum install -y java && \
    unzip ./installation-files/jboss-eap-7.3.0.zip -d ./installation-files && \
    sed -i "s/Welcome\ to\ JBoss\ EAP\ 7/Welcome\ to\ JBoss\ Fadin\ 8/" /labs/installation-files/jboss-eap-7.3/welcome-content/index.html 

EXPOSE 8080 8443 9990

USER root

ENTRYPOINT [ "/bin/bash", "-c"]

CMD ["$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0"]
