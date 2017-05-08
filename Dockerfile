FROM node:latest
MAINTAINER jonhunter1977@gmail.com

# Create app directory
RUN mkdir -p /opt/hr-react
WORKDIR /opt/hr-react

# Install app dependencies
COPY package.json /opt/hr-react/
COPY yarn.lock /opt/hr-react/
RUN yarn install --production

# Bundle app source
COPY express /opt/hr-react/express
COPY react /opt/hr-react/react

# Expose the express application port
EXPOSE 4001

CMD [ "npm", "run", "express" ]
