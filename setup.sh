#!/bin/bash

echo "🎓 Talent Academy PWA Setup Script"
echo "=================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js v16 or higher first."
    echo "   Download from: https://nodejs.org/"
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 16 ]; then
    echo "❌ Node.js version 16 or higher is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ npm version: $(npm -v)"

# Check if MongoDB is running
if ! command -v mongod &> /dev/null; then
    echo "⚠️  MongoDB is not installed. Please install MongoDB first."
    echo "   Download from: https://www.mongodb.com/try/download/community"
    echo "   Or use MongoDB Atlas: https://www.mongodb.com/atlas"
else
    echo "✅ MongoDB is installed"
fi

echo ""
echo "📦 Installing backend dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install backend dependencies"
    exit 1
fi

echo "✅ Backend dependencies installed successfully"

echo ""
echo "📱 Installing frontend dependencies..."
cd client
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install frontend dependencies"
    exit 1
fi

cd ..

echo "✅ Frontend dependencies installed successfully"

echo ""
echo "📁 Creating necessary directories..."
mkdir -p uploads
mkdir -p logs

echo "✅ Directories created"

echo ""
echo "🔧 Setting up environment file..."
if [ ! -f .env ]; then
    cp env.example .env
    echo "✅ Environment file created from template"
    echo "⚠️  Please edit .env file with your configuration"
else
    echo "✅ Environment file already exists"
fi

echo ""
echo "🚀 Setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Edit .env file with your configuration"
echo "2. Start MongoDB (if using local installation)"
echo "3. Run 'npm run dev' to start the application"
echo ""
echo "The application will be available at:"
echo "- Frontend: http://localhost:3000"
echo "- Backend API: http://localhost:5000/api"
echo ""
echo "For detailed setup instructions, see README.md"
echo ""
echo "🎉 Happy coding with Talent Academy PWA!"
