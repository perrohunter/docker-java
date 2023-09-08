# Contenedor de Docker para Java

Este proyecto contiene un ejemplo simple de como contenerizar una aplicacion de Springboot en Java en Docker.

Para correr el codigo ejemplo

```bash
gradle build
java -jar build/libs/docker-java-0.0.1-SNAPSHOT.jar
```

Para Crear el contenedor de Docker

```bash
docker build -t tu-cuenta/tu-tag .
```

Para correr el contenedor, vamos a mapear el puerto `8080` que la aplicación expone al arrancar por `4000` en nuestro ordenador. 

```bash
docker run -it -p 4000:8080 tu-cuenta/tu-tag
```

Y visita http://localhost:4000 

# Usuarios de Apple Silicon

Si estas trabajando en una Mac con Apple Silicon (M1, M2) es mejor que crees una imagen multi-arquitectura


```bash
docker buildx build --platform linux/amd64,linux/arm64 --push -t tu-cuenta/tu-tag . 
```
