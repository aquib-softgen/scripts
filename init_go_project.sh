#!/bin/bash

# Check if a project name was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project-name>"
    exit 1
fi

PROJECT_NAME=$1

# Create the project directory
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Create the directory structure
mkdir -p cmd/server \
         internal/{api/handlers,config,db,models,repository} \
         migrations \
         pkg \
         scripts

# Function to create a Go file with package name
create_go_file() {
    echo "package $2" > $1
    echo "" >> $1  # Add a newline after the package declaration
}

# Create main files with package names
create_go_file cmd/server/main.go main
create_go_file internal/api/routes.go api
create_go_file internal/config/config.go config
create_go_file internal/db/db.go db

# Create other necessary files
touch .env \
      .gitignore

# Initialize Go module
go mod init $PROJECT_NAME

echo "Project structure for $PROJECT_NAME has been initialized."
echo "Don't forget to update your .gitignore and .env files!"
