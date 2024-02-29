FROM node:18-alpine AS base
RUN mkdir -p /opt/node_app/app
WORKDIR /opt/node_app
COPY ./code/package.json package-lock.json* ./
RUN npm install --no-optional && npm cache clean --force && npm update --force
ENV PATH /opt/node_app/node_modules/.bin:$PATH
EXPOSE 3001 5000
WORKDIR /opt/node_app/app
COPY . .
