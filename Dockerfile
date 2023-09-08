# Vamos a usar la imagen mas nueva de gradle
FROM gradle:latest AS BUILD

# El directorio donde vamos a trabajar
WORKDIR /usr/app/

# Copia todo el codigo a adentro del contenedor
COPY . .

# Crea el fat jar
RUN gradle build

# Segundo stage

# Este stage es sin gradle, solo java
FROM openjdk:latest

# Ponemos un directorio de trabajo
WORKDIR /usr/app/

# Copiamos todos nuestros jars
COPY --from=BUILD /usr/app/build/libs/docker-java-0.0.1-SNAPSHOT.jar build/libs/app.jar

# definimos el puerto
EXPOSE 8080

# Especificamos la forma en que se ejecuta el contenedor
#ENTRYPOINT exec java -jar /usr/app/build/libs/docker-java-0.0.1-SNAPSHOT.jar

CMD ["java","-jar","/usr/app/build/libs/app.jar"]