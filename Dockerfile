FROM node:14.17.6
ADD package.json .
RUN npm install
RUN mkdir /opt/external_modules
RUN npm install --prefix /opt/external_modules rookout
ENV NODE_OPTIONS "--require rookout/start"
ENV NODE_PATH "/opt/external_modules/node_modules"
ADD . .
RUN npm build