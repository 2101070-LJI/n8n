-- n8n MySQL initialization script
-- This file runs automatically when MySQL container starts for the first time

CREATE DATABASE IF NOT EXISTS n8n_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE n8n_db;

-- Sample table for n8n workflow data demonstration
CREATE TABLE IF NOT EXISTS sensor_data (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sensor_name VARCHAR(100) NOT NULL,
  value FLOAT NOT NULL,
  unit VARCHAR(20),
  recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO sensor_data (sensor_name, value, unit) VALUES
  ('temperature', 25.5, 'Celsius'),
  ('humidity', 60.2, 'percent'),
  ('pressure', 1013.25, 'hPa');

GRANT ALL PRIVILEGES ON n8n_db.* TO 'n8n_user'@'%';
FLUSH PRIVILEGES;
