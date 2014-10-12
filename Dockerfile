FROM        ubuntu:14.04

# File Author / Maintainer
MAINTAINER Shawn Bower

# Update the repository sources list
EXPOSE 8080

#Environment Variables
ENV Xmx 2048m

## Server setup
RUN apt-get -qq update
RUN apt-get -y install openjdk-7-jre
RUN apt-get -y install tomcat7 
RUN apt-get -y install curl

ADD bin/start-tomcat.sh /opt/start-tomcat.sh
RUN chmod +x /opt/start-tomcat.sh

## Libs
RUN cd /usr/share/tomcat7/lib/; curl -o mysql-connector-java-5.1.32.jar  http://nat.cucloud.net/mysql-connector-java-5.1.32.jar

## Add Runtime Configuration
RUN mkdir -p /usr/share/tomcat7/kuali/main/dev
ADD conf/rice.keystore /usr/share/tomcat7/kuali/main/dev/rice.keystore
ADD conf/rice-config.xml /usr/share/tomcat7/kuali/main/dev/rice-config.xml

## Add war
RUN cd /var/lib/tomcat7/webapps/; curl -o kr-dev.war http://nat.cucloud.net/kr-dev.war

ENTRYPOINT ["/opt/start-tomcat.sh"]