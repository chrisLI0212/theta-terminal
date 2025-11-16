#!/bin/bash

set -euo pipefail



# HARD-CODED CREDENTIALS (your real username/password go here)

THETA_EMAIL="chrisicey0212@gmail.com"

THETA_PASSWORD="Aa02120119"



cat <<EOF >/app/creds.txt

${THETA_EMAIL}

${THETA_PASSWORD}

EOF



chmod 600 /app/creds.txt



exec "$@"

