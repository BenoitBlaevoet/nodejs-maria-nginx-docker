FROM node:18

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Set folder and permision for MariaDB
RUN mkdir /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/sites-available/default

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy entrypoint
COPY app/entrypoint.sh /app/entrypoint.sh

# give entrypoint execution rights
RUN chmod +x /app/entrypoint.sh

# Copy the rest of the code
COPY . .

# Expose the port 80
EXPOSE 80

# Set the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]

# Build the image : docker build -t node-api --build-arg nginx_conf=nginx.conf .
# Run the image : docker run -p 8080:80 node-api --name node-api-app