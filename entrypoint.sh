#!/bin/bash
set -euo pipefail

: "${THETA_EMAIL?Must set THETA_EMAIL}"
: "${THETA_PASSWORD?Must set THETA_PASSWORD}"

cat <<EOF >/app/creds.txt
${THETA_EMAIL}
${THETA_PASSWORD}
EOF

chmod 600 /app/creds.txt

exec "$@"
