# DockerAngular

## Steps

docker pull nginx:alpine

docker run -d -p 80:80 nginx:alpine

ng build prod

docker run -d -p 80:80 -v D:/proyectos/ANGULAR/Ejemplo_NGINX/docker-angular/dist/dockerangular:/usr/share/nginx/html nginx:alpine

# construir imagen

docker build . -t docker-angular:latest

# levantar en nginx la imagen construida

docker run -d -p 80:80 docker-angular:latest

# Param manejar rutas en nginx crer el archivo nginx-custom.conf y agregar:

server{
listen 80;
location / {
root /usr/share/nginx/html;
index index.html index.htm;
try_files $uri $uri/ /index.html =404;
}
}
