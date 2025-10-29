# Etapa 1: Build da aplicação
FROM maven:3.9.3-eclipse-temurin-17 AS build

WORKDIR /app

# Copia arquivos Maven
COPY pom.xml .
COPY src ./src

# Compila e gera o jar
RUN mvn clean package -DskipTests

# Etapa 2: rodar a aplicação
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copia o jar gerado na etapa de build
COPY --from=build /app/target/petlife-api-0.0.1-SNAPSHOT.jar app.jar

# Expõe porta
EXPOSE 8080

# Variáveis de ambiente para escutar todas as interfaces
ENV JAVA_OPTS="-Dserver.address=0.0.0.0 -Dserver.port=80"

# Comando de início
CMD ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
