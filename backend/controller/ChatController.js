const Chat = require('../models/Chat');

const getUserChats = async(req, res) => {
    const userId = req.user._id;
    if (!userId) {
        return res.status(400).json({ message: "User ID is required!" });
    }
    try {
        const chats = await Chat.find({ participants: userId });
        if (chats.length === 0) {
            return res.status(404).json({ message: "No chats found for this user!" });
        } else {
            return res.status(200).json(chats);
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const getChatById = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Chat ID is required!" });
    }
    try {
        const chat = await Chat.findById(id);
        if (!chat) {
            return res.status(404).json({ message: "Chat not found!" });
        } else {
            return res.status(200).json(chat);
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const createChat = async(req, res) => {
    const { participants, lastMessage, lastMessageAt, name, type } = req.body;
    if (!participants || participants.length < 2) {
        return res.status(400).json({ message: "At least 2 participants are required to create a chat!" });
    }
    if (!lastMessageAt || isNaN(Date.parse(lastMessageAt))) {
        return res.status(400).json({ message: "Valid lastMessageAt date is required!" });
    }
    try {
        const newChat = new Chat({
            participants,
            lastMessage: lastMessage || null,
            lastMessageAt: new Date(lastMessageAt),
            name: name || "",
            type: type || "private",
        });
        const savedChat = await newChat.save();
        if (savedChat) {
            return res.status(201).json(savedChat);
        } else {
            return res.status(400).json({ message: "Failed to create chat!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const updatedChat = async(req, res) => {
    const { id } = req.params;
    const { participants, lastMessage, lastMessageAt, name, type } = req.body;
    if (!id) {
        return res.status(400).json({ message: "Chat ID is required!" });
    }
    try {
        const updatingChat = await Chat.findByIdAndUpdate(id, {
            participants,
            lastMessage: lastMessage || null,
            lastMessageAt: lastMessageAt ? new Date(lastMessageAt) : undefined,
            name: name || undefined,
            type: type || undefined
        }, { new: true });
        if (!updatingChat) {
            return res.status(404).json({ message: "Chat not found!" });
        } else {
            return res.status(200).json(updatingChat);
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const deleteChat = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Chat ID is required!" });
    }
    try {
        const deletingChat = await Chat.findByIdAndDelete(id);
        if (!deletingChat) {
            return res.status(404).json({ message: "Chat not found!" });
        } else {
            return res.status(200).json({ message: "Chat deleted successfully!", chat: deletingChat });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const getChat = async(req, res) => {
    try {
        const chat = await Chat.find({}).sort({ createdAt: -1 });
        if (chat) {
            return res.status(200).json(chat);
        } else {
            return res.status(404).json({ message: "No chats found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

module.exports = {
    getUserChats,
    getChatById,
    createChat,
    updatedChat,
    deleteChat,
    getChat
}