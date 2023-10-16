FROM node:alpine AS builder

WORKDIR /

COPY . .

RUN npm install 

FROM node:alpine AS runner

WORKDIR /
COPY . .


COPY --from=builder /next.config.js /next.config.js
COPY --from=builder /public /public
COPY --from=builder /package.json /package.json

RUN npm install 

EXPOSE 3000

CMD ["npm", "run", "dev"]