FROM node:18.18.0-alpine3.18 as build

COPY package.json package.json

RUN npm install

FROM nginx:1.21.6
COPY --from=build node_modules /usr/share/nginx/html/node_modules
COPY ./ /usr/share/nginx/html/