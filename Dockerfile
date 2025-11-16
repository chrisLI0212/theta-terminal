FROM debian:stable-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY config.toml .
COPY entrypoint.sh .

# Copy your Theta Terminal binary or script.
# Example assumes a file named theta-terminal (update accordingly).
COPY theta-terminal ./theta-terminal
RUN chmod +x ./theta-terminal entrypoint.sh

EXPOSE 25503 25520

ENTRYPOINT ["./entrypoint.sh"]
CMD ["./theta-terminal", "--config", "/app/config.toml"]
