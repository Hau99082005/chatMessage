const mongoose = require('mongoose');


const AttachmentSchema = mongoose.Schema({
    message: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Message',
        required: true,
        index: true,
    },
    file_url: {
        type: String,
        required: true,
        trim: true,
    },
    file_name: {
        type: String,
        required: true,
        trim: true,
    },
    file_type: {
        type: String,
        required: true,
        trim: true,
    },
    file_size: {
        type: Number,
        default: 0,
        min: 0,
        required: true,
    }
}, { timestamps: true });


const Attachment = mongoose.model('Attachment', AttachmentSchema);
module.exports = Attachment;