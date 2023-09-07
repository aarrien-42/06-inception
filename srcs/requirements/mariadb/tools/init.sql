-- Set root password
CREATE USER 'root'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

-- Create database
CREATE DATABASE IF NOT EXISTS wordpress;

-- Create new user
CREATE USER 'aarrien'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wordpress.* TO 'aarrien'@'%';

-- Flush privileges to make changes take effect
FLUSH PRIVILEGES;

