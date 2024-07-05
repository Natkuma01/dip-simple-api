# Base image
FROM --platform=linux/amd64 node:18
# change to this if build this in the cloud: FROM --platform=linux/amd64 node:18


# Create app directory
WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Copy the .env and .env.development files
# (comment out because the project do not have an env file)
# COPY .env .env.development ./

# Creates a "dist" folder with the production build
RUN npm run build

# Expose the port on which the app will run
EXPOSE 3000

# Start the server using the production build
CMD npm run migration:run && npm run start:prod