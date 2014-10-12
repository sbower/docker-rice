#!/bin/sh

if [ -n "${Xmx}" ];
then
	sed -i s/Xmx.*\ /Xmx${Xmx}\ /g /etc/default/tomcat7
fi

echo "JAVA_OPTS=\"\${JAVA_OPTS} -Ddatasource.url=${DB_URL} -Ddatasource.username=${DB_USER} -Ddatasource.password=${DB_PASS} -Dappserver.url=${APP_URL}\"" >> /etc/default/tomcat7

service tomcat7 restart

#Override the exit command to prevent accidental container distruction 
echo 'alias exit="echo Are you sure? this will kill the container. use Ctrl + p, Ctrl + q to detach or ctrl + d to exit"' > ~/.bashrc

#Run bash to keep container running and provide interactive mode
bash