# node-external-module
Simple example of using a Node application with Rookout installed as an external module and without changing the application's code.

1. We're using NODE_OPTIONS to load/require the Rookout module:
```
ENV NODE_OPTIONS "--require rookout/start"
```
2. Using NODE_PATH to refer to the folder where Rookout is installed:
```
ENV NODE_PATH "/opt/external_modules/node_modules"
```
3. We install the Rookout module to a specific folder that we referenced in NODE_PATH:
```
RUN npm install --prefix /opt/external_modules rookout
```
4. Run the docker image the same way you would run it without Rookout but make sure that you added the token and or controller host (if using an on-prem controller):
```
docker run -p 3123:3123 "ROOKOUT_TOKEN=[Your organization token]" my-image-name node index.js
```
