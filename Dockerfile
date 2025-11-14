FROM eclipse-temurin:17-jdk-jammy

RUN apt-get update && apt-get install -y wget curl

WORKDIR /app

RUN wget -q https://download-latest.thetadata.us -O ThetaTerminal.jar

# Important: Expose the actual port (Railway will map it)
EXPOSE 25510

# Run Theta Terminal
CMD ["java", "-jar", "ThetaTerminal.jar", "chrisicey0212@gmail.com", "Aa02120119"]
