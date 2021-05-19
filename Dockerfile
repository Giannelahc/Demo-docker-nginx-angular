#Node
FROM node:latest as nod
WORKDIR /app
COPY ./ /app/
RUN npm install
ARG configuration=production
RUN npm run build -- --prod --configuration=${configuration}
#RUN npm run build -- --prod

#Nginx
FROM nginx:alpine
COPY --from=nod /app/dist/docker-angular /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf
