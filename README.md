# Spring Security 5 OAuth2 Login Quickstart

This application demonstrates how to set up and configure a Spring Boot 2.x application to secure a REST API using Spring Security 5.3. Users are redirected to authenticate with GitHub using the OAuth2 `explicit grant` flow.

## Getting Started

Build the application:

```shell
./mvnw package
```

Run the application with GitHub credentials provided on the CLI:
```shell
java \
  -jar target/spring-security-5-oauth2-login.jar \
  -D spring.security.oauth2.client.registration.github.clientId="d482bc606f86d1d696dd" \
  -D spring.security.oauth2.client.registration.github.clientSecret="08a805c6a3cd2718f4ab17b5b90398fac966ea58"
```

### Environment variables
Execute using environment variables to pass the GitHub credentials which is more useful for containers:
```shell
GITHUB_API_CLIENT_ID=d482bc606f86d1d696dd
GITHUB_API_CLIENT_SECRET=08a805c6a3cd2718f4ab17b5b90398fac966ea58
java -jar target/spring-security-5-oauth2-login.jar
```

## Development

If you wish to use Maven to build and run the application locally:
```shell
./mvnw spring-boot:run -Drun.jvmArguments="-D spring.security.oauth2.client.registration.github.clientId=d482bc606f86d1d696dd -D spring.security.oauth2.client.registration.github.clientSecret=08a805c6a3cd2718f4ab17b5b90398fac966ea58"
```

## Containerisation

Containerisation is provided by means of a [Dockerfile](https://docs.docker.com/engine/reference/builder/).

You can build and manage the container using the following Docker commands:

Build the application
```shell
./mvnw package -D skipTests
```

Build the Docker image:
```shell
docker image build -t spring-security-5-oauth2-login:1.0 .
```

Start the container:
```shell
docker container run \
--env GITHUB_API_CLIENT_ID=d482bc606f86d1d696dd \
--env GITHUB_API_CLIENT_SECRET=08a805c6a3cd2718f4ab17b5b90398fac966ea58 \
--publish 5000:5000 \
--detach \
--name spring-security-5-oauth2-login \
spring-security-5-oauth2-login:1.0
```

Get direct access to the container:
```shell
docker exec -it spring-security-5-oauth2-login //bin//sh
printenv
```

## CI/CD

This example uses [GitHub Actions](https://docs.github.com/en/actions) to build the main artifacts and to publish to [Docker Hub](https://hub.docker.com/)

