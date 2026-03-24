const mongoose = require('mongoose');

const dbConnect = async() => {
    const uri = process.env.MONGODB_URI;
    if (!uri) {
        console.error('MONGODB_URI is not defined');
        return;
    }
    try {
        await mongoose.connect(uri);
        console.log('Connected to MongoDB successfully!');
    } catch (error) {
        console.error('Error connecting to MongoDB:', error);
    }
}

module.exports = dbConnect;