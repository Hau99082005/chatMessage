const MessageRead = require('../models/MessageRead');

const getMessageRead = async(req, res) => {
    try {
        const messageread = await MessageRead.find({}).sort({ createdAt: -1 });
        if (!messageread) {
            return res.status(404).json({ message: "MessageRead not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const getMessageReadById = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "MessageRead ID is required!" });
    }
    try {
        const messageread = await MessageRead.findById(id);
        if (messageread) {
            return res.status(200).json(messageread);
        } else {
            return res.status(404).json({ message: "MessageRead not found!" });
        }

    } catch (error) {
        return res.status(500).json({ messgae: "Internal Server Error" });
    }
}

const createMessageRead = async(req, res) => {
    const { message, user } = req.body;
    if (!message || !user) {
        return res.status(400).json({ message: "Message and User are required!" });
    }
    const readAt = new Date();
    try {
        const newMessageRead = new MessageRead({
            message,
            user,
            readAt
        });
        const savedMessageRead = await newMessageRead.save();
        if (!savedMessageRead) {
            return res.status(400).json({ message: "Failed to create MessageRead!" });
        } else {
            return res.status(201).json({ message: "MessageRead created successfully!" }, savedMessageRead);
        }


    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}
const updatedMessageRead = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "MessageRead ID is required!" });
    }
    try {
        const updatingMessageRead = await MessageRead.findByIdAndUpdate(id,
            req.body, { new: true }
        );
        if (!updatingMessageRead) {
            return res.status(404).json({ message: "MessageRead not found!" });
        } else {
            return res.status(200).json({ message: "MessageRead updated successfully!" }, updatingMessageRead);
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const deleteMessageRead = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "MessageRead ID is required!" });
    }
    try {
        const deletingMessageRead = await MessageRead.findByIdAndDelete(id);
        if (!deletingMessageRead) {
            return res.status(404).json({ message: "MessageRead not found!" });
        } else {
            return res.status(200).json({ message: "MessageRead deleted successfully!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

module.exports = {
    getMessageRead,
    getMessageReadById,
    createMessageRead,
    updatedMessageRead,
    deleteMessageRead
}