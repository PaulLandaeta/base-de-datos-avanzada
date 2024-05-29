docker-compose down -v
docker network create --driver bridge my_network

docker-compose up -d


docker exec -it mysql-master bash
mysql -u root -p

GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';
FLUSH PRIVILEGES;

ALTER USER 'replication_user'@'%' IDENTIFIED WITH mysql_native_password BY 'control123';

SHOW MASTER STATUS;


docker exec -it mysql-slave bash

mysql -uroot -p


CHANGE MASTER TO
  MASTER_HOST='mysql-master',
  MASTER_USER='replication_user',
  MASTER_PASSWORD='control123',
  MASTER_LOG_FILE='mysql-bin.000003',
  MASTER_LOG_POS=850,
  MASTER_PORT=3306;


START SLAVE;


SHOW SLAVE STATUS\G


