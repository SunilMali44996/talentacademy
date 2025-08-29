const mongoose = require('mongoose');
const Student = require('./models/Student');
require('dotenv').config();

async function createAdmin() {
  try {
    // Connect to MongoDB
    await mongoose.connect(process.env.MONGODB_URI);
    console.log('Connected to MongoDB');

    // Check if admin already exists
    const existingAdmin = await Student.findOne({ role: 'admin' });
    if (existingAdmin) {
      console.log('Admin already exists:', existingAdmin.email);
      return;
    }

    // Create admin user
    const admin = new Student({
      name: 'Admin User',
      email: 'admin@talentacademy.com',
      phone: '9876543210',
      password: 'Admin@123',
      class: '5th Board', // Default class
      role: 'admin',
      studentId: 'ADMIN001'
    });

    await admin.save();
    console.log('Admin created successfully!');
    console.log('Email: admin@talentacademy.com');
    console.log('Password: Admin@123');

  } catch (error) {
    console.error('Error creating admin:', error);
  } finally {
    await mongoose.disconnect();
  }
}

createAdmin();
