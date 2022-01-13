FROM maven:3.8.4-jdk-8-slim AS builder

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN mvn clean package

FROM tomcat:9.0-jdk8-openjdk
COPY --from=builder /myapp/target/*.war /usr/local/tomcat/webapps/app.war
