# Base image
FROM ubuntu:18.04

# Installing nodejs v10
RUN apt-get update && apt-get install -y curl build-essential && curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

# Change the work directory
WORKDIR /opt/practica-cloud

# Copying files into the image
COPY . .

# Installing dependencies
RUN npm install --only=prod

# Exposing port
EXPOSE 8888

# Command
CMD ["npm", "start"]
