CREATE USER 'Adhi'@'localhost' IDENTIFIED BY 'Admin@123!';
CREATE USER 'dana'@'%' IDENTIFIED BY 'Admin@1234!';

FLUSH PRIVILEGES;

SET PASSWORD FOR 'Adhi'@'localhost' = 'Admin@135!';
SET PASSWORD FOR 'dana'@'%' = 'Admin@2468!';

GRANT SELECT, INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'Adhi'@'localhost';
GRANT SELECT ON belajar_mysql.* TO  'dana'@'%';

SHOW GRANTS FOR 'Adhi'@'localhost';
SHOW GRANTS FOR 'dana'@'%';


DROP USER 'Adhi'@'localhost';
DROP USER 'dana'@'%';