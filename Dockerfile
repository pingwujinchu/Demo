FROM cr.d.xiaomi.net/devops-public/maven-mi-repo:3-jdk-8-slim as builder
WORKDIR /opt
COPY . ./

#以用户的maven打包为准，用户可能会跳过test
RUN mvn clean package -Ptest

FROM cr.d.xiaomi.net/devops-public/openjdk:8-jre-slim
ENV TZ "Asia/Shanghai"

COPY --from=builder /opt/target/*.jar /opt/app.jar
WORKDIR /opt
#以用户的CMD为准，用户可能有不同的启动命令

EXPOSE 8080
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "app.jar"]
