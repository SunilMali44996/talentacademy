# 🎓 Talent Academy PWA

A fully functional Progressive Web App (PWA) for "Talent Academy" coaching institute with both Student and Admin panels.

## ✨ Features

### 🔐 Authentication & Security
- **OTP-based Login System** - Secure login via Email/Phone with OTP verification
- **JWT Token Authentication** - Secure API access with role-based permissions
- **Password Management** - Forgot password, reset password functionality
- **Rate Limiting** - Protection against brute force attacks

### 👨‍🎓 Student Panel
- **Personal Dashboard** - Overview of attendance, fees, and performance
- **Profile Management** - View and edit personal information
- **Attendance Tracking** - View attendance records and statistics
- **Fee Management** - View fee details, payment history, and status
- **Study Materials** - Access class-specific notes, PDFs, and resources
- **Online Tests** - Take MCQ-based tests with instant results
- **Results & Performance** - View test results, grades, and progress
- **Notices & Announcements** - Stay updated with important information

### 👨‍💼 Admin Panel
- **Student Management** - Add, edit, delete students with unique IDs
- **Attendance Management** - Mark daily attendance for all students
- **Content Management** - Upload and manage study materials
- **Test Creation** - Create and manage online MCQ tests
- **Result Management** - Enter and update student results
- **Fee Management** - Track payments, generate receipts, send reminders
- **Communication** - Send notices and announcements to students
- **Analytics & Reports** - Comprehensive reporting and insights

### 📱 PWA Features
- **Mobile-First Design** - Fully responsive and mobile-friendly
- **Offline Support** - Works offline with service worker caching
- **Install to Home Screen** - Native app-like experience
- **Push Notifications** - Real-time updates and alerts
- **Fast Loading** - Optimized performance and caching

## 🛠️ Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - Database with Mongoose ODM
- **JWT** - Authentication and authorization
- **Multer** - File upload handling
- **Nodemailer** - Email functionality
- **Twilio** - SMS services

### Frontend
- **React.js** - User interface library
- **Tailwind CSS** - Utility-first CSS framework
- **React Router** - Client-side routing
- **React Query** - Data fetching and caching
- **Framer Motion** - Animations and transitions
- **React Hook Form** - Form handling and validation

### PWA
- **Service Worker** - Offline functionality and caching
- **Web App Manifest** - App installation and appearance
- **Push API** - Notifications
- **Background Sync** - Offline data synchronization

## 🚀 Quick Start

### Prerequisites
- Node.js (v16 or higher)
- MongoDB (v5 or higher)
- npm or yarn package manager

### 1. Clone the Repository
```bash
git clone <repository-url>
cd talent-academy-pwa
```

### 2. Install Dependencies
```bash
# Install backend dependencies
npm install

# Install frontend dependencies
cd client
npm install
cd ..
```

### 3. Environment Configuration
Create a `.env` file in the root directory:
```env
# Server Configuration
PORT=5000
NODE_ENV=development

# MongoDB Connection
MONGODB_URI=mongodb://localhost:27017/talent_academy

# JWT Secret
JWT_SECRET=your_super_secret_jwt_key_here

# Email Configuration (Gmail)
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password

# Twilio Configuration (SMS)
TWILIO_ACCOUNT_SID=your_twilio_account_sid
TWILIO_AUTH_TOKEN=your_twilio_auth_token
TWILIO_PHONE_NUMBER=your_twilio_phone_number

# OTP Configuration
OTP_EXPIRY=300000
OTP_LENGTH=6

# File Upload
UPLOAD_PATH=./uploads
MAX_FILE_SIZE=10485760
```

### 4. Database Setup
```bash
# Start MongoDB (if not running)
mongod

# The app will automatically create the database and collections
```

### 5. Run the Application
```bash
# Development mode (runs both backend and frontend)
npm run dev

# Or run separately:

# Backend only
npm start

# Frontend only (in another terminal)
cd client
npm start
```

The application will be available at:
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000/api

## 📱 PWA Installation

### Desktop
1. Open the application in Chrome/Edge
2. Click the install icon in the address bar
3. Click "Install" to add to desktop

### Mobile
1. Open the application in Chrome/Safari
2. Tap the share button
3. Select "Add to Home Screen"
4. Tap "Add" to install

## 🔧 Configuration

### Email Setup (Gmail)
1. Enable 2-factor authentication on your Gmail account
2. Generate an App Password
3. Use the App Password in EMAIL_PASS

### SMS Setup (Twilio)
1. Create a Twilio account
2. Get your Account SID and Auth Token
3. Purchase a phone number
4. Update the environment variables

### File Upload
- Create an `uploads` directory in the root
- Ensure proper write permissions
- Configure MAX_FILE_SIZE as needed

## 📊 Database Schema

### Collections
- **students** - Student information and authentication
- **attendance** - Daily attendance records
- **fees** - Fee structure and payment history
- **notes** - Study materials and resources
- **tests** - Online test configurations
- **testResults** - Student test results and scores
- **notices** - Announcements and notifications

## 🚀 Deployment

### Heroku
```bash
# Create Heroku app
heroku create your-app-name

# Set environment variables
heroku config:set NODE_ENV=production
heroku config:set MONGODB_URI=your_mongodb_atlas_uri
heroku config:set JWT_SECRET=your_production_jwt_secret

# Deploy
git push heroku main
```

### Vercel
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

### Docker
```bash
# Build image
docker build -t talent-academy-pwa .

# Run container
docker run -p 5000:5000 talent-academy-pwa
```

## 🔒 Security Features

- **JWT Authentication** - Secure token-based authentication
- **Password Hashing** - Bcrypt encryption for passwords
- **Rate Limiting** - Protection against abuse
- **Input Validation** - Server-side validation and sanitization
- **CORS Protection** - Cross-origin request security
- **Helmet.js** - Security headers and protection

## 📱 Mobile Optimization

- **Responsive Design** - Works on all screen sizes
- **Touch-Friendly** - Optimized for mobile interactions
- **Fast Loading** - Optimized images and assets
- **Offline Support** - Service worker caching
- **PWA Features** - Installable and app-like experience

## 🧪 Testing

```bash
# Run backend tests
npm test

# Run frontend tests
cd client
npm test
```

## 📝 API Documentation

### Authentication Endpoints
- `POST /api/auth/register` - Student registration
- `POST /api/auth/send-otp` - Send OTP for login
- `POST /api/auth/verify-otp` - Verify OTP and login
- `POST /api/auth/login` - Password-based login
- `GET /api/auth/me` - Get current user profile

### Student Endpoints
- `GET /api/students/profile` - Get student profile
- `GET /api/attendance/student/:id` - Get attendance records
- `GET /api/fees/student/:id` - Get fee details
- `GET /api/notes/class/:class` - Get study materials
- `GET /api/tests/class/:class` - Get available tests
- `POST /api/tests/:id/submit` - Submit test answers

### Admin Endpoints
- `GET /api/admin/dashboard` - Admin dashboard data
- `POST /api/admin/students` - Create new student
- `PUT /api/admin/students/:id` - Update student
- `POST /api/admin/attendance` - Mark attendance
- `POST /api/admin/notes` - Upload study material
- `POST /api/admin/tests` - Create new test
- `POST /api/admin/notices` - Create new notice

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- **Email**: support@talentacademy.com
- **Phone**: +91-XXXXXXXXXX
- **Address**: Pipliya Mandi, Mandsaur, Madhya Pradesh, India

## 🙏 Acknowledgments

- **Talent Academy** - For the vision and requirements
- **Open Source Community** - For the amazing tools and libraries
- **Students & Teachers** - For feedback and testing

---

**Made with ❤️ for Talent Academy - Excellence in Education**
