FROM node:12

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt -y install moreutils
RUN apt-get -y install vim
RUN apt-get -y install build-essential checkinstall

WORKDIR /home/express-typescript-server
COPY /src /home/express-typescript-server/src
COPY package.json /home/express-typescript-server/package.json
COPY apidoc.json /home/express-typescript-server/apidoc.json
COPY nodemon.json /home/express-typescript-server/nodemon.json

RUN npm i -g ts-node
RUN npm i -g typescript
RUN npm i -g nodemon
RUN npm i -g forever
RUN npm i -g apidoc
RUN npm install

EXPOSE 3000