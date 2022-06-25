FROM openjdk:11-jre
ARG DOCKERIZE_VERSION=v0.6.1
# ARG = bir varaible'dir aslinda. 
# CLI da docker buld dederken version degisitiriceksek kullaniliyor
# yani docker buld --build-arg VERSION=2 -t <new-image-name> . 
# --build-arg list = Set build-time variables (image olusurken verilen bir variable, sadece dockerfile ile alakali,)
ARG EXPOSED_PORT=9090
ENV SPRING_PROFILES_ACTIVE docker,mysql
# container olustuktan sonra, containerin icinde kullaniliyor
# containerdaki variable 
# env variable lar developerdan gelir bize
# ARG ise sadece dockerfile image olurken (build-time) ise yariyor. aralarindaki fark bu.
ADD https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz dockerize.tar.gz
# yukaridaki linkteki tar dosyasini dockerize.tar.gz dosyasina at.
# ADD url'den dosya getiriyor ama
# COPY getiremiyor, sadece localden aliyor.
RUN tar -xzf dockerize.tar.gz
# yukarida unzip yap dockerize.tar.gz dosyasini
RUN chmod +x dockerize
# executable calisir hale getiriyoruz
ADD ./target/*.jar /app.jar
# icinde bulundugum klasorun yani ./target'in icindeki tum jar dosyalarini /app.jar  olarak container'a tasi dosyasina tasi
EXPOSE ${EXPOSED_PORT}
# sadece port adini gosterir
# expose sadece kullaniciya bilgi vermek icin
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
# entrypoint = java'yi kullanarak " " icindeki kodu calistir diyor. inmuteable (degistirilemez) aslinda bunu calistir diyor = "java" "-jar","/app.jar"
# CMD = change the parameter, can overwrite.