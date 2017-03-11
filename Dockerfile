FROM node:argon

# Install required prereqs.
RUN apt-get -y update && apt-get -y install netcat

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Update npm
RUN npm install -g npm

RUN npm install -g nodemon

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install --verbose --registry=https://registry.npm.taobao.org

# Bundle app source
COPY . /usr/src/app

CMD ["sh", "./Scripts/docker-startup.sh"]

# Expose the port.
EXPOSE 8080
