FROM node:latest
MAINTAINER jonhunter1977@gmail.com

# Create app directory
RUN mkdir -p /opt/ci-training
WORKDIR /opt/ci-training

# Install app dependencies
COPY package.json /opt/ci-training/
COPY yarn.lock /opt/ci-training/
RUN yarn install --production

# Bundle app source
COPY express /opt/ci-training/express
COPY react /opt/ci-training/react

# Expose the express application port
EXPOSE 4001

CMD [ "npm", "run", "express" ]
