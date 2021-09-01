FROM openjdk:11
MAINTAINER Gavin Martin <gavin@cloudpro.consulting>

ADD ./target/spring-security-5-oauth2-login.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/spring-security-5-oauth2-login.jar"]

HEALTHCHECK --interval=30s --timeout=30s CMD curl -f http://localhost:5000/actuator/health || exit 1

EXPOSE 5000