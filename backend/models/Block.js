const mongoose = require('mongoose');

const BlockSchema = mongoose.Schema({
    blocker: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
        index: true,
    },
    blocked: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true,
        index: true,
    }
}, { timestamps: true });

const Block = mongoose.model('Block', BlockSchema);
module.exports = Block;