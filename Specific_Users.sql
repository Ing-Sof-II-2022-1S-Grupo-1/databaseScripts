-- Creamos las cuentas específicas

-- Cuenta de lectura
CREATE USER 'lectura'@'localhost' IDENTIFIED BY 'permisoS0l0lectura';
GRANT SELECT ON eliotdb.* TO 'lectura'@'localhost';

-- Cuenta de insert
CREATE USER 'insert'@'localhost' IDENTIFIED BY 'permisoS0l01nsert';
GRANT SELECT, INSERT ON eliotdb.* TO 'insert'@'localhost';

-- Cuenta de update
CREATE USER 'update'@'localhost' IDENTIFIED BY 'permisoS0l0upd4t3';
GRANT SELECT, UPDATE ON eliotdb.* TO 'update'@'localhost';

-- Cuenta de delete
CREATE USER 'delete'@'localhost' IDENTIFIED BY 'permisoS0l0d3l3t3';
GRANT SELECT, UPDATE, DELETE ON eliotdb.* TO 'delete'@'localhost';

-- Limpiamos caché de los privilegios
FLUSH PRIVILEGES;

