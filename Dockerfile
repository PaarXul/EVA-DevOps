# Usa una imagen base de Java
FROM openjdk:17-jdk-alpine

# Copia el archivo JAR que esta en el entorno variable de ejecucion del pipeline
COPY target/myapp.jar myapp.jar

# Establece el punto de entrada para ejecutar la aplicación
ENTRYPOINT ["java","-jar","/myapp.jar"]

# Establece el puerto en el que la aplicación escuchará las solicitudes
EXPOSE 8080