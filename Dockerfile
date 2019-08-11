FROM node:11-alpine as builder

WORKDIR /app
COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile --non-interactive
COPY . .
RUN yarn build

# ---------
FROM node:11-alpine

COPY --from=builder /app/.next /app/.next
COPY --from=builder /app/package.json /app/
COPY --from=builder /app/node_modules /app/node_modules

WORKDIR /app/

CMD ["yarn", "start:prod"]