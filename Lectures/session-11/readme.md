docker-compose up -d


docker exec -it mysql-master bash
mysql -uroot -p

GRANT ALL ON *.* TO 'replication_user'@'%';

FLUSH PRIVILEGES;

SHOW MASTER STATUS;


docker exec -it mysql-slave bash

mysql -uroot -p


CHANGE MASTER TO
  MASTER_HOST='mysql_master',
  MASTER_USER='replication_user',
  MASTER_PASSWORD='control123',
  MASTER_LOG_FILE='mysql-bin.000003',
  MASTER_LOG_POS=553,
  MASTER_PORT=4406;


START SLAVE;


SHOW SLAVE STATUS\G


