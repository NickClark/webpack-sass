# Pull base image.
FROM node

RUN mkdir -p /usr/src/deps/node_modules /usr/src/deps/bower_components
WORKDIR /usr/src/deps

COPY package.json /usr/src/deps/
RUN npm install

RUN npm install -g bower
RUN echo "alias bower='bower --allow-root'" > ~/.bashrc
COPY bower.json /usr/src/deps/
RUN bower install --allow-root

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

ENTRYPOINT ["bin/start"]
