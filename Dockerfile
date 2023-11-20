FROM maven:3.9.5 as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM azul/zulu-openjdk:21.0.1-jdk
WORKDIR /app
COPY --from=build /app/target/demoapp.jar /app/
EXPOSE 8080
CMD ["java", "-jar","demoapp.jar"]