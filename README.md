# Express Typescript Example Server

To save some time in the future, I set up an example express server written in typescript that utilizes nodemon for a sleeker and more responsive development environment. I'm hoping this repo can be used as a starting point or a reference when implementing your express server. If you see something that's implemented incorrectly, or want to add an essential feature I left out, feel free to add it but please thoroughly describe your change in the commit.

## Getting Started Locally

```
git clone https://{{username}}@bitbucket.org/vfvf/express-typescript-server.git
cd src/
npm i
npm start
```

## Getting Started through Docker

```
git clone https://{{username}}@bitbucket.org/vfvf/express-typescript-server.git

make build

// DEV
make run-dev
make express-typescript-server

// PROD
make run-prod

```