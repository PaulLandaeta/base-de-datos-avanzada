docker network create --driver bridge my_network

docker-compose up -d


docker exec -it mysql-master bash
mysql -u root -p

GRANT ALL ON *.* TO 'replication_user'@'%' IDENTIFIED BY control123;

FLUSH PRIVILEGES;

SHOW MASTER STATUS;


docker exec -it mysql-slave bash

mysql -uroot -p


CHANGE MASTER TO
  MASTER_HOST='mysql-master',
  MASTER_USER='replication_user',
  MASTER_PASSWORD='control123',
  MASTER_LOG_FILE='mysql-bin.000004',
  MASTER_LOG_POS=1877,
  MASTER_PORT=3306;


START SLAVE;


SHOW SLAVE STATUS\G


