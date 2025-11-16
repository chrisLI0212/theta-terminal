#!/bin/sh
set -e

# Hard‑coded credentials (only safe in a private image)
THETA_EMAIL="chrisicey0212@gmail.com"
THETA_PASSWORD="Aa02120119"

# Write credentials file exactly as required by the docs
cat >/app/creds.txt <<EOF
${THETA_EMAIL}
${THETA_PASSWORD}
EOF

chmod 600 /app/creds.txt

# Start Theta Terminal with creds-file and config
exec java -jar /app/ThetaTerminal.jar \
  --creds-file=/app/creds.txt \
  --config=/app/config_1.properties

