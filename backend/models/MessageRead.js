const mongoose = require('mongoose');

const MessageReadSchema = mongoose.Schema({
    message: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Message',
        required: true,
        index: true,
    },
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
        index: true,
    },
    readAt: {
        type: Date,
        default: Date.now,
        required: true,
    }
}, { timestamps: true });

const MessageRead = mongoose.model('MessageRead', MessageReadSchema);
module.exports = MessageRead;