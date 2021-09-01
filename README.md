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
  -Dspring.security.oauth2.client.registration.github.clientId="d9c976bc9a08ca500bc3" \
  -Dspring.security.oauth2.client.registration.github.clientSecret="af8530051f8b2127decee80b900dc55f578373ee" \
  -jar target/spring-security-5-oauth2-login.jar
```

### Environment variables
Execute using environment variables to pass the GitHub credentials which is more useful for containers:
```shell
export GITHUB_API_CLIENT_ID=d9c976bc9a08ca500bc3
export GITHUB_API_CLIENT_SECRET=af8530051f8b2127decee80b900dc55f578373ee
java -jar target/spring-security-5-oauth2-login.jar
```

## Development

If you wish to use Maven to build and run the application locally:
```shell
./mvnw spring-boot:run -Dspring-boot.run.jvmArguments="-Dspring.security.oauth2.client.registration.github.clientId=d9c976bc9a08ca500bc3 -Dspring.security.oauth2.client.registration.github.clientSecret=af8530051f8b2127decee80b900dc55f578373ee"
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
--env GITHUB_API_CLIENT_ID=d9c976bc9a08ca500bc3 \
--env GITHUB_API_CLIENT_SECRET=af8530051f8b2127decee80b900dc55f578373ee \
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

This example uses [GitHub Actions workflows](https://docs.github.com/en/actions) to build the main artifacts and to publish to [Docker Hub](https://hub.docker.com/)

