FROM maven:3.8.4-jdk-8 AS builder

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN mvn clean package

FROM tomcat:6.0
COPY --from=builder /myapp/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080

