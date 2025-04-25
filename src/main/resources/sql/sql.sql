CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (username, email, password) VALUES
                                                  ('alice', 'alice1@example.com', '123456'),
                                                  ('bob', 'bob1@example.com', '123456'),
                                                  ('charlie', 'charlie1@example.com', '123456'),
                                                  ('david', 'david1@example.com', '123456'),
                                                  ('eve', 'eve1@example.com', '123456');
