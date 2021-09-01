FROM openjdk:11
MAINTAINER Gavin Martin <gavin@cloudpro.consulting>

ADD ./target/spring-security-5-oauth2-login.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/spring-security-5-oauth2-login.jar"]

EXPOSE 5000