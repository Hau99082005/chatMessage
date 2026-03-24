const mongoose = require('mongoose');

const ChatParticipantSchema = mongoose.Schema({
    chat: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Chat',
        required: true,
        index: true,
    },
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
        index: true,
    },
    role: {
        type: String,
        enum: ["admin", "member"],
        default: "member",
        required: true,
    },
    joinedAt: {
        type: Date,
        default: Date.now,
        required: true,
    }
}, { timestamps: true });

const ChatParticipant = mongoose.model('ChatParticipant', ChatParticipantSchema);
module.exports = ChatParticipant;