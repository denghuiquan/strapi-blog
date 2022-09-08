FROM node:14.20.0
ENV PROJECT_NAME strapi-blog
LABEL MAINTAINER="dhq <denghuiquan@foxmail.com>"

USER root

RUN mkdir /app
WORKDIR /app

RUN yarn global add pm2
COPY package.json /app/
RUN TMPDIR=/tmp yarn --ignore-optional && yarn cache clean

COPY ./ /app/
RUN yarn build
EXPOSE 1337

CMD pm2 start --no-daemon process.yml
