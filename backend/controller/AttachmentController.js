const Attachment = require('../models/Attachment');

const getAttachments = async(req, res) => {
    try {
        const attachments = await Attachment.find({ message: req.params.messageId });
        if (!attachments) {
            return res.status(404).json({ error: "Attachments not found!" });
        } else {
            return res.status(200).json({ attachments });
        }

    } catch (error) {
        return res.status(500).json({ error: error.message || "Internal Server Error!" });
    }
}

const getAttachmentsById = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ error: "Attachment ID is required!" });
    }
    try {
        const attachment = await Attachment.findById(id);
        if (attachment) {
            return res.status(200).json({ attachment });
        } else {
            return res.status(404).json({ message: "Attachment not found!" });
        }

    } catch (error) {
        return res.status(500).json({ error: error.message || "Internal Server Error!" });
    }
}

const createAttachment = async(req, res) => {
    const { message, file_url, file_name, file_type, file_size } = req.body;
    if (!message || !file_url || !file_name || !file_type || file_size === undefined) {
        return res.status(400).json({ error: "All fields are required!" });
    }
    try {
        const newAttachment = new Attachment({
            message,
            file_url,
            file_name,
            file_type,
            file_size
        });
        const savedAttachment = await newAttachment.save();
        if (savedAttachment) {
            return res.status(200).json({ attachment: savedAttachment });
        } else {
            return res.status(400).json({ error: "Failed to create attachments!" });
        }

    } catch (error) {
        return res.status(500).json({ error: error.message || "Internal Server Error!" });
    }
}

const updatedAttachment = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ error: "Attachment ID is required!" });
    }
    try {
        const updatingAttachment = await Attachment.findByIdAndUpdate(id,
            req.body, { new: true }
        );
        if (updatedAttachment) {
            return res.status(200).json({ attachment: updatingAttachment });
        } else {
            return res.status(400).json({ error: "Failed to update attachments!" });
        }

    } catch (error) {
        return res.status(500).json({ error: error.message || "Internal Server Error!" });
    }
}

const deleteAttachment = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ error: "Attachment ID is required!" });
    }
    try {
        const deletingAttachment = await Attachment.findByIdAndDelete(id);
        if (deletingAttachment) {
            return res.status(200).json({ message: "Attachment deleted successfully!" });
        } else {
            return res.status(400).json({ error: "Failed to delete attachments!" });
        }

    } catch (error) {
        return res.status(500).json({ error: error.message || "Internal Server Error!" });
    }
}

module.exports = {
    getAttachments,
    getAttachmentsById,
    createAttachment,
    updatedAttachment,
    deleteAttachment
}