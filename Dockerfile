FROM tomcat:latest

COPY ./target/addressbook.war /usr/local/tomcat/webapps/