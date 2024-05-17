CREATE TABLE grades(
	id int not null 
	auto_increment 
	primary key,
	grade int not null
);
DELIMITER $$ 
CREATE PROCEDURE insert_data()
BEGIN
	DECLARE i INT DEFAULT 0;
	WHILE i < 1000000 DO
	 INSERT INTO grades (grade)
	 VALUES(FLOOR(RAND()*100));
	 SET i = i + 1;
	END WHILE;
END $$

DELIMITER ;

CALL insert_data();
EXPLAIN format = json
SELECT * 
from grades 
where grade = 50;

EXPLAIN format = json
SELECT * 
from grades 
where grade BETWEEN 20 and 50;

SELECT COUNT(*)
FROM grades;

CREATE INDEX idx_grade 
ON grades(grade);

CREATE TABLE grade_partition(
	id int not null 
	auto_increment,
	grade int not null,
	PRIMARY KEY (id, grade)
)
PARTITION BY RANGE(grade) (
  PARTITION P0 values less than (20),
  PARTITION P1 values less than (40),
  PARTITION P2 values less than (60),
  PARTITION P3 values less than MAXVALUE  
);

INSERT INTO grade_partition
SELECT * FROM grades 

EXPLAIN format = json
SELECT *
FROM grade_partition 
WHERE grade = 33
	 
