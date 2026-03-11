# Stage 1: Build the application assets Using Node.js
FROM node:20-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package files (best practice for caching layers)
COPY package.json ./

# Copy the rest of the application
COPY . .

# Build the project (creates the dist folder)
RUN npm run build

# Stage 2: Serve the application using a lightweight, unprivileged Nginx web server
FROM nginxinc/nginx-unprivileged:alpine

# Add metadata for maintainability
LABEL maintainer="wimukthimadhavi55-afk"
LABEL description="NEXUS eSports Landing Page containerized securely"

# Copy the built standalone assets from the builder stage
# We only copy the dist folder to minimize the final image size and attack surface
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose the unprivileged port that Nginx is configured to listen on
EXPOSE 8080

# Define a health check to ensure the container is serving content properly
# This uses wget which is built into Alpine
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:8080/ > /dev/null || exit 1

# Note: The nginx-unprivileged image already runs as non-root user 'nginx' (UID 101)
# which adheres to the principle of least privilege.
