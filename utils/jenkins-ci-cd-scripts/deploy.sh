mvn clean package
rm -f /var/lib/tomcat/webapps/*.war
mv target/*.war /var/lib/tomcat/webapps
