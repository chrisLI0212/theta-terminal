# Java 21 runtime (Theta: 17+ required, 21+ recommended)
FROM eclipse-temurin:21-jre-jammy

# Work directory inside container
WORKDIR /app

# Install curl to download the Theta Terminal JAR
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy config and entrypoint into image
COPY config.toml .
COPY entrypoint.sh .

# Ensure entrypoint is executable
RUN chmod +x /app/entrypoint.sh

# Download Theta Terminal v3 JAR into /app
ENV THETA_JAR_URL="https://download-unstable.thetadata.us/ThetaTerminalv3.jar"
RUN curl -fSL "$THETA_JAR_URL" -o /app/theta-terminal.jar

# Ports used by Theta Terminal
EXPOSE 25503 25520

# entrypoint.sh will create creds.txt (from hard-coded values) and then run Java
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command to start Theta Terminal
CMD ["java", "-jar", "/app/theta-terminal.jar", "--config", "/app/config.toml"]
