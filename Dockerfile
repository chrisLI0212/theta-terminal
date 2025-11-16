FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY config.toml .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENV THETA_JAR_URL="https://download-unstable.thetadata.us/ThetaTerminalv3.jar"
RUN curl -fSL "$THETA_JAR_URL" -o theta-terminal.jar

EXPOSE 25503 25520

ENTRYPOINT ["./entrypoint.sh"]
CMD ["java", "-jar", "/app/theta-terminal.jar", "--config", "/app/config.toml"]
