const Message = require('../models/Message');

const getMessages = async(req, res) => {
    try {
        const messages = await Message.find({ chat: req.params.chatId }).sort({ createdAt: -1 });
        if (!messages.length === 0) {
            return res.status(400).json({ message: 'No messages found for this chat' });
        } else {
            return res.status(200).json(messages);
        }

    } catch (error) {
        return res.status(500).json({ error: 'Internal Server Error' });
    }
}

const getMessageById = async(req, res) => {
    const { messageId } = req.params;
    if (!messageId) {
        return res.status(400).json({ message: 'Message ID is required' });
    }
    try {
        const message = await Message.findByID(messageId);
        if (message) {
            return res.status(200).json({ message: "Message get successfully!", data: message });
        } else {
            return res.status(404).json({ message: 'Message not found' });
        }

    } catch (error) {
        return res.status(500).json({ error: 'Internal Server Error' });
    }
}

const createMessage = async(req, res) => {
    const { chatId, senderId, text, message_type, reply_to, is_edited } = req.body;
    if (!chatId || !senderId || !text) {
        return res.status(400).json({ message: 'Chat ID, Sender ID and Text are required' });
    }
    try {
        const newmessage = new Message({
            chat: chatId,
            sender: senderId,
            text,
            message_type: message_type || "text",
            reply_to: reply_to || null,
            is_edited: is_edited || false
        });
        const savedMessage = await newmessage.save();
        if (savedMessage) {
            return res.status(201).json({ message: "Message created successfully!", data: savedMessage });
        } else {
            return res.status(400).json({ message: 'Failed to create message' });
        }

    } catch (error) {
        return res.status(500).json({ error: 'Internal Server Error' });
    }
}

const updatedMessage = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: 'Message ID is required' });
    }
    try {
        const updatingMessage = await Message.findByIdUpdate(id,
            req.body, { new: true }
        );
        if (updatingMessage) {
            return res.status(200).json({ message: "Message updated successfully!", data: updatedMessage });
        } else {
            return res.status(404).json({ message: 'Message not found' });
        }

    } catch (error) {
        return res.status(500).json({ error: 'Internal Server Error' });
    }
}

const deleteMessage = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: 'Message ID is required' });
    }
    try {
        const deletingMessage = await Message.findByIdAndDelete(id);
        if (deletingMessage) {
            return res.status(200).json({
                message: "Message deleted successfully!",
                data: deletingMessage
            });
        } else {
            return res.status(404).json({ message: 'Message not found' });
        }

    } catch (error) {
        return res.status(500).json({ error: 'Internal Server Error' });
    }
}

const getAllMessages = async(req, res) => {
    try {
        const messages = await Message.find({}).sort({ createdAt: -1 });
        if (messages) {
            return res.status(200).json(messages);
        } else {
            return res.status(404).json({ message: 'No messages found!' });
        }

    } catch (error) {
        return res.status(500).json({ error: 'Internal Server Error' });
    }
}

module.exports = {
    getMessages,
    getMessageById,
    createMessage,
    updatedMessage,
    deleteMessage,
    getAllMessages
}