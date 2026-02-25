CREATE DATABASE mlflow;
CREATE USER mlflow_user WITH PASSWORD 'your_secure_password';
GRANT ALL PRIVILEGES ON DATABASE mlflow TO mlflow_user;