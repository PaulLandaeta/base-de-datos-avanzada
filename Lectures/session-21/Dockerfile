FROM mongo:latest

COPY ./config/mongod.conf /etc/mongod.conf
COPY ./config/mongo-init.js /docker-entrypoint-initdb.d/

CMD ["mongod", "--config", "/etc/mongod.conf"]