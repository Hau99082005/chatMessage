const mongoose = require('mongoose');

const ChatSchema = mongoose.Schema({
    participants: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
        index: true,
    }, ],
    lastMessage: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Message',
        default: null,
    },
    lastMessageAt: {
        type: Date,
        default: Date.now,
        required: true,
    },
    name: {
        type: String,
        required: false,
        trim: true,
        default: "",
    },
    type: {
        type: String,
        enum: ["private", "group"],
        default: "private",
        required: true,
    },
}, { timestamps: true });

const Chat = mongoose.model('Chat', ChatSchema);
module.exports = Chat;