const ChatParticipant = require('../models/ChatParticipant');


const getChatParticipants = async(req, res) => {
    try {
        const
            chatparticipant = await ChatParticipant.find({}).sort({ createdAt: -1 });
        if (chatparticipant) {
            return res.status(200).json(chatparticipant);
        } else {
            return res.status(404).json({ message: "Chat participants not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const getChatParticipantById = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Chat participant ID is required!" });
    }
    try {
        const chatparticipant = await ChatParticipant.findById(id);
        if (chatparticipant) {
            return res.status(200).json({ message: "Chat participant get successfully!", data: chatparticipant });
        } else {
            return res.status(400).json({ message: "Chat participant not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const createChatParticipant = async(req, res) => {
    const { chat, user, role } = req.body;
    if (!chat || !user) {
        return res.status(400).json({ message: "Chat and User are required!" });
    }
    const joinedAt = new Date();
    try {
        const newChatParticipant = new ChatParticipant({
            chat,
            user,
            role: role || "member",
            joinedAt
        });
        const savedChatParticipant = await newChatParticipant.save();
        if (savedChatParticipant) {
            return res.status(201).json({ message: 'Chat participant created successfully!', data: savedChatParticipant });
        } else {
            return res.status(400).json({ message: 'Failed to create chat participant!' });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

const updatedChatParticipant = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Chat participant ID is required!" });
    }
    try {
        const chatparticpant = await ChatParticipant.findByIdAndUpdate(id,
            req.body, { new: true }
        );
        if (chatparticpant) {
            return res.status(200).json({ message: "Chat participant updated successfully!", data: chatparticpant });
        } else {
            return res.status(404).json({ message: "Chat participant not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}
const deleteChatParticipant = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Chat participant ID are required" });
    }
    try {
        const deletingChatParticipant = await ChatParticipant.findByIdAndDelete(id);
        if (deletingChatParticipant) {
            return res.status(200).json({ message: "Chat participant deleted successfully!", data: deletingChatParticipant });
        } else {
            return res.status(404).json({ message: "Chat participant not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error!" });
    }
}

module.exports = {
    getChatParticipants,
    getChatParticipantById,
    createChatParticipant,
    updatedChatParticipant,
    deleteChatParticipant
}