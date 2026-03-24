const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    firebaseUid: {
        type: String,
        default: "",
    },
    username: {
        type: String,
        required: true,
        unique: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
        lowercase: true,
        trim: true
    },
    password: {
        type: String,
        required: true,
        minLength: 6,
    },
    avatar: {
        type: String,
        default: "",
    },
    bio: {
        type: String,
        default: "",
    }
}, { timestamps: true });

const User = mongoose.model('User', userSchema);
module.exports = User;