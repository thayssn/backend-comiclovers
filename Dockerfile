FROM node:10
WORKDIR /usr/src/app
COPY package*.json ./
RUN yarn
COPY . .
EXPOSE 3333
CMD [ "yarn", "start" ]
