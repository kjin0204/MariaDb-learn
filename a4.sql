DROP TABLE t1;
DROP TABLE t2;

CREATE TABLE t1 (
id int(10) NOT NULL AUTO_INCREMENT ,
c1 int(10) NOT NULL DEFAULT '0',
c2 int(10) NOT NULL DEFAULT '0',
PRIMARY KEY (id),
KEY idx_c1 (c1)
) ENGINE=InnoDB;

CREATE TABLE t2 (
id int(10) NOT NULL AUTO_INCREMENT ,
c1 int(10) NOT NULL DEFAULT '0',
c2 int(10) NOT NULL DEFAULT '0',
PRIMARY KEY (id),
KEY idx_c1 (c1)
) ENGINE=InnoDB;

insert into t1 select null,round(rand()*100),round(rand()*1000)
from information_schema.columns a1, information_schema.columns b1  
LIMIT 100;

insert INTO t2 select null,round(rand()*100),round(rand()*1000)
from information_schema.columns a1, information_schema.columns b1  
LIMIT 100;

SELECT * FROM t1;
SELECT * FROM t2;



SET SESSION optimizer_switch='join_cache_incremental=on';
SET SESSION optimizer_switch='join_cache_hashed=on';
SET SESSION optimizer_switch='join_cache_bka=on';
SET SESSION join_cache_level=2;

select count(*) from t1 join t2 on t1.c2 = t2.c2;
explain select count(*) from t1 join t2 on t1.c2 = t2.c2; -- 최적화기가 


