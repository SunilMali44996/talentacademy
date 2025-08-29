@echo off
chcp 65001 >nul
echo 🎓 Talent Academy PWA Setup Script
echo ==================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js v16 or higher first.
    echo    Download from: https://nodejs.org/
    pause
    exit /b 1
)

REM Check Node.js version
for /f "tokens=1,2 delims=." %%a in ('node --version') do set NODE_VERSION=%%a
set NODE_VERSION=%NODE_VERSION:~1%
if %NODE_VERSION% lss 16 (
    echo ❌ Node.js version 16 or higher is required. Current version: 
    node --version
    pause
    exit /b 1
)

echo ✅ Node.js version: 
node --version

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm first.
    pause
    exit /b 1
)

echo ✅ npm version: 
npm --version

echo.
echo 📦 Installing backend dependencies...
call npm install

if %errorlevel% neq 0 (
    echo ❌ Failed to install backend dependencies
    pause
    exit /b 1
)

echo ✅ Backend dependencies installed successfully

echo.
echo 📱 Installing frontend dependencies...
cd client
call npm install

if %errorlevel% neq 0 (
    echo ❌ Failed to install frontend dependencies
    pause
    exit /b 1
)

cd ..

echo ✅ Frontend dependencies installed successfully

echo.
echo 📁 Creating necessary directories...
if not exist "uploads" mkdir uploads
if not exist "logs" mkdir logs

echo ✅ Directories created

echo.
echo 🔧 Setting up environment file...
if not exist ".env" (
    copy "env.example" ".env"
    echo ✅ Environment file created from template
    echo ⚠️  Please edit .env file with your configuration
) else (
    echo ✅ Environment file already exists
)

echo.
echo 🚀 Setup completed successfully!
echo.
echo Next steps:
echo 1. Edit .env file with your configuration
echo 2. Start MongoDB (if using local installation)
echo 3. Run 'npm run dev' to start the application
echo.
echo The application will be available at:
echo - Frontend: http://localhost:3000
echo - Backend API: http://localhost:5000/api
echo.
echo For detailed setup instructions, see README.md
echo.
echo 🎉 Happy coding with Talent Academy PWA!
pause
