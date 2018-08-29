# phoenix
Servicio REST Golang para cambio de informacion de clientes

Some Utils commands

sudo docker build -t="phoenix/nginx" --no-cache=true .
sudo docker run -d -p 80:80 --restart="always" --name=phoenix_nginx phoenix/nginx

sudo docker build -t="phoenix/mariadb" --no-cache=true .
sudo docker run -d -p 3306:2206 --restart="always" --name=phoenix_mariadb phoenix/mariadb

sudo docker build -t="phoenix/rabbit" --no-cache=true .
sudo docker run -d -e RABBITMQ_USER=foo -e RABBITMQ_PASS=bar -p 5672:5672 -p 15672:15672  --restart="always" --name=phoenix_rabbit phoenix/rabbit

docker logs --tail 50 --follow --timestamps NAME_CONTAINER
