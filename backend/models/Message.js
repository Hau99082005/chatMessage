const mongoose = require('mongoose');

const MessageSchema = mongoose.Schema({
    chat: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Chat',
        required: true,
        index: true,
    },
    sender: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
        index: true
    },
    text: {
        type: String,
        required: true,
        trim: true,
    },
    message_type: {
        type: String,
        enum: ["text", "image", "file", "video", "audio"],
        default: "text",
        required: true,
    },
    reply_to: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Message',
        default: null,
    },
    is_edited: {
        type: Boolean,
        default: false,
        required: true,
    }
}, { timestamps: true });

const Message = mongoose.model('Message', MessageSchema);
module.exports = Message;