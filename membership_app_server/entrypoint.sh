#!/bin/bash
# entrypoint.sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Apply database migrations
# Use environment variables for run mode etc.
echo "Applying database migrations..."
/app/server --role=maintenance --mode="$RUN_MODE" --logging="$LOGGING" --apply-migrations

# Execute the main server command passed to the script
echo "Starting Serverpod server..."
exec /app/server --mode="$RUN_MODE" --server-id="$SERVER_ID" --logging="$LOGGING" --role="$ROLE" --port="$PORT" --service-port="$SERVICE_PORT" --webSocket-port="$WEB_SOCKET_PORT" "$@"