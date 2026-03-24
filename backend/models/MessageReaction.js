const mongoose = require('mongoose');

const MessageRectionSchema = mongoose.Schema({
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
    reaction: {
        type: String,
        required: true,
        trim: true,
    }
}, { timestamps: true });

const MessageReaction = mongoose.model('MessageReaction', MessageRectionSchema);
module.exports = MessageReaction;