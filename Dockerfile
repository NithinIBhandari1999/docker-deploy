FROM node:16-alpine as teamalpha
WORKDIR /var/app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=teamalpha /var/app/build /usr/share/nginx/html