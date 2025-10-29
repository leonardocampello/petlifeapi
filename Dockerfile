# Etapa 1 - Build do projeto
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2 - Executar a aplicação
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copia o jar gerado na etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta usada pelo Spring Boot
EXPOSE 8080

# Define que o Spring deve escutar em todas as interfaces
ENV JAVA_OPTS="-Dserver.address=0.0.0.0 -Dserver.port=8080"

# Inicia a aplicação
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
