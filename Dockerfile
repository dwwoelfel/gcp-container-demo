FROM node:12 as builder

COPY package.json .
COPY yarn.lock .
COPY src src
COPY tsconfig.json .
COPY .eslintignore .
COPY .eslintrc.js .

RUN yarn install
RUN yarn build-ts

FROM node:12 as node_modules

COPY package.json .
COPY yarn.lock .

ENV NODE_ENV production
RUN yarn install --production

FROM node:12

WORKDIR /usr/src/app

ENV NODE_ENV production
COPY --from=builder dist dist
COPY --from=builder package.json .
COPY --from=node_modules node_modules node_modules

CMD [ "node", "dist/server.js" ]
