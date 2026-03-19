# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy the static website files from the src directory to Nginx's default public directory
COPY src/ /usr/share/nginx/html/

# Expose port 80 for the web server
EXPOSE 80

# Start Nginx continuously
CMD ["nginx", "-g", "daemon off;"]
