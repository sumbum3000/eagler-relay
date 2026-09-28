FROM eclipse-temurin:17-jre
WORKDIR /app
RUN apt-get update && apt-get install -y wget
RUN wget https://raw.githubusercontent.com/lDEVinux/eaglercraft/main/stable-download/sp-relay.jar
RUN java -jar sp-relay.jar || true
RUN sed -i 's/port=8081/port=8080/' relayConfig.ini
EXPOSE 8080
CMD ["java", "-jar", "sp-relay.jar"]
