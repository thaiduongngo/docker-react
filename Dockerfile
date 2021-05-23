# build stage
FROM node:alpine AS build

WORKDIR "/app"

COPY ./package.json .

RUN npm install

COPY . .

CMD ["npm", "run", "build"]

# run stage
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
