# Check if a project name was provided
if ($Args.Count -ne 1) {
    Write-Host "Usage: ./init_go_project.ps1 <project-name>"
    exit 1
}

$PROJECT_NAME = $Args[0]

# Create the project directory
New-Item -Path $PROJECT_NAME -ItemType Directory -Force
Set-Location -Path $PROJECT_NAME

# Create the directory structure
$directories = @(
    "cmd/server",
    "internal/api/handlers",
    "internal/config",
    "internal/db",
    "internal/models",
    "internal/repository",
    "migrations",
    "pkg",
    "scripts"
)

foreach ($dir in $directories) {
    New-Item -Path $dir -ItemType Directory -Force
}

# Function to create a Go file with package name
function Create-GoFile {
    param (
        [string]$filePath,
        [string]$packageName
    )
    Add-Content -Path $filePath -Value "package $packageName"
    Add-Content -Path $filePath -Value "`n"  # Add a newline after the package declaration
}

# Create main files with package names
Create-GoFile "cmd/server/main.go" "main"
Create-GoFile "internal/api/routes.go" "api"
Create-GoFile "internal/config/config.go" "config"
Create-GoFile "internal/db/db.go" "db"

# Create other necessary files
New-Item -Path ".env" -ItemType File -Force
New-Item -Path ".gitignore" -ItemType File -Force

# Initialize Go module
go mod init $PROJECT_NAME

Write-Host "Project structure for $PROJECT_NAME has been initialized."
Write-Host "Don't forget to update your .gitignore and .env files!"
