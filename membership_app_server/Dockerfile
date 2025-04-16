# ---- Build Stage ----
    FROM dart:3.3.0 AS build

    WORKDIR /app
    
    # Copy everything needed for both server and frontend build
    COPY . .
    
    # --- Build Server ---
    # Install server dependencies
    RUN dart pub get
    
    # Compile the server executable
    # (Consider adding --no-sound-null-safety if needed, but ideally fix issues)
    RUN dart compile exe bin/main.dart -o bin/server
    
    # --- Build Frontend (Jaspr) ---
    # Assuming your frontend is in a directory named 'frontend'
    WORKDIR /app/frontend
    RUN dart pub get
    # Generate Jaspr build artifacts (adjust command if needed, e.g., --ssr)
    RUN jaspr build --output=../static # Build directly into a static folder at the root
    
    # Reset WORKDIR for final stage copies
    WORKDIR /app
    
    # ---- Runtime Stage ----
    FROM alpine:latest
    
    # Install required runtime dependencies for Serverpod server on Alpine
    # PostgreSQL client is needed for migrations, bash might be needed for scripts
    RUN apk add --no-cache postgresql16-client bash
    
    WORKDIR /app
    
    # Set environment variables for Serverpod configuration
    # These can be overridden in docker-compose.yaml if needed
    ENV RUN_MODE=production
    ENV SERVER_ID=default
    ENV LOGGING=normal
    ENV ROLE=monolith
    # Default ports (can be mapped differently in docker-compose)
    ENV PORT=8080
    ENV SERVICE_PORT=8081
    ENV WEB_SOCKET_PORT=8082
    
    # Copy essential runtime files from the Dart SDK image
    COPY --from=build /runtime/ /
    
    # Copy the compiled server executable
    COPY --from=build /app/bin/server /app/server
    
    # Copy configuration files (Corrected path)
    # We'll primarily use production config in Docker
    COPY --from=build /app/config/ /app/config/
    
    # Copy migration files (Corrected path)
    COPY --from=build /app/migrations/ /app/migrations/
    
    # Copy BUILT static web assets (Corrected path)
    # Copying from the 'static' folder created during frontend build
    COPY --from=build /app/static/ /app/static/
    
    # Copy the entrypoint script (we will create this next)
    COPY entrypoint.sh /app/entrypoint.sh
    RUN chmod +x /app/entrypoint.sh
    
    # Expose the ports Serverpod listens on
    EXPOSE 8080
    EXPOSE 8081
    EXPOSE 8082
    
    # Use the entrypoint script to run migrations then the server
    ENTRYPOINT ["/app/entrypoint.sh"]