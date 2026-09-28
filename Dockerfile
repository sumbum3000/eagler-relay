FROM eclipse-temurin:17-jre
WORKDIR /app
RUN apt-get update && apt-get install -y wget
RUN wget https://raw.githubusercontent.com/lDEVinux/eaglercraft/main/stable-download/sp-relay.jar

# Force the server to stop after 5 seconds so the Docker build can complete
RUN timeout 5s java -jar sp-relay.jar || true

# Set port to 8080
RUN sed -i 's/port=.*/port=8080/' relayConfig.ini

EXPOSE 8080
CMD ["java", "-jar", "sp-relay.jar"]
