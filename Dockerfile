FROM tomcat:9.0.40-jdk8-openjdk

ARG WAR_FILE
ARG CONTEXT

COPY ${WAR_FILE} /usr/local/tomcat/webapps/${CONTEXT}.war

# frontend/target/tasks.war
# tasks.war