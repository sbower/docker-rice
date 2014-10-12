#!/bin/sh

if [ -n "${Xmx}" ];
then
	sed -i s/Xmx.*\ /Xmx${Xmx}\ /g /etc/default/tomcat7
fi

echo "JAVA_OPTS=\"\${JAVA_OPTS} -Ddatasource.url=${DB_URL} -Ddatasource.username=${DB_USER} -Ddatasource.password=${DB_PASS} -Dappserver.url=${APP_URL}\"" >> /etc/default/tomcat7

service tomcat7 start 
tail -f /var/log/tomcat7/catalina.out