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

# Download Theta Terminal v3 JAR into /app
ENV THETA_JAR_URL="https://download-unstable.thetadata.us/ThetaTerminalv3.jar"
RUN curl -fSL "$THETA_JAR_URL" -o /app/ThetaTerminalv3.jar

# Create credentials file with your login info
RUN echo "chrisicey0212@gmail.com" > /app/creds.txt && \
    echo "Aa02120119" >> /app/creds.txt

# Copy config if you have one (optional - rename to match what Terminal expects)
# COPY config.toml /app/config.toml

# Ports used by Theta Terminal
EXPOSE 25503 25520

# Start ThetaTerminal with credentials file - no config file since it doesn't exist
CMD ["java", "-jar", "/app/ThetaTerminalv3.jar", "--creds-file=/app/creds.txt"]
