#!/usr/bin/env bash

# Creates a superuser with grant all privileges
# In an active mariadb installation
# Context
# Mariadb lts 10.11
# 2024-04-18, 06:54:05 PM
# https://mariadb.com/kb/en/authentication-from-mariadb-10-4/

# Credentials (Replace with your actual values)
MYSQL_USER="your_username"
MYSQL_PASSWORD="your_password"
MYSQL_HOST="localhost"

# Execute the command
sudo mysql -u mysql -p "$MYSQL_PASSWORD" -h "$MYSQL_HOST" -e "$SQL_COMMAND"
