# Etapa 1: Use OpenJDK 17 para rodar a aplicação
FROM openjdk:17-jdk-slim

# Diretório de trabalho
WORKDIR /app

# Copia o jar da aplicação
COPY target/petlife-api-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta que a API vai escutar
EXPOSE 8080

# Define variáveis de ambiente para garantir que o Spring Boot escute em todas as interfaces
ENV JAVA_OPTS="-Dserver.address=0.0.0.0 -Dserver.port=8080"

# Comando para iniciar a aplicação
CMD ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
