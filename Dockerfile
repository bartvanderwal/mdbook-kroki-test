# Stage 1: Build the mdBook
FROM rust:1.74.0 AS builder

# Install mdbook and necessary preprocessors
RUN cargo install mdbook mdbook-kroki-preprocessor

# Set the working directory
WORKDIR /book

# Copy the contents of your book into the build container
COPY . .

# Build the mdBook using the installed mdbook binary
RUN mdbook build

# Stage 2: NGINX container to serve the built book
FROM nginx:1.25.3

# Copy the custom NGINX configuration
# COPY custom-nginx.conf /etc/nginx/conf.d/default.conf

# Copy the built book from the build container to NGINX's web root
COPY --from=builder /book/book /usr/share/nginx/html

# Expose port 8081
EXPOSE 8081

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]

# https://hub.docker.com/_/nginx