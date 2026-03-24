const MessageReaction = require('../models/MessageReaction');

const getMessageReactions = async(req, res) => {
    try {
        const messagereactions = await MessageReaction.find({}).sort({ createdAt: -1 });
        if (messagereactions) {
            return res.status(200).json(messagereactions);
        } else {
            return res.status(404).json({ message: "MessageReactions not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const getMessageReactionById = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "MessageReaction ID is required" });
    }
    try {
        const messagereaction = await MessageReaction.findById(id);
        if (messagereaction) {
            return res.status(200).json(messagereaction);
        } else {
            return res.status(404).json({ message: "MessageReaction not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const createMessageReaction = async(req, res) => {
    const { message, user, reaction } = req.body;
    if (!message || !user || !reaction) {
        return res.status(400).json({ message: "Message, User and Reaction are required!" });
    }

    try {
        const newMessageReaction = new MessageReaction({
            message,
            user,
            reaction
        });
        const savedMessageReaction = await newMessageReaction.save();
        if (savedMessageReaction) {
            return res.status(201).json({ message: "MessageReaction created successfully!" }, savedMessageReaction);
        } else {
            return res.status(400).json({ message: "Failed to create MessageReaction!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const updatedMessageReaction = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: 'MessageReaction ID is required!' });
    }
    try {
        const updatingMessageReaction = await MessageReaction.findByIdAndUpdate(id,
            req.body, { new: true }
        );
        if (!updatingMessageReaction) {
            return res.status(404).json({ message: "MessageReaction not found!" });
        } else {
            return res.status(200).json({ message: "MessageReaction updated successfully!" }, updatingMessageReaction);
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const deleteMessageReaction = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "MessageReaction ID is required!" });
    }
    try {
        const deletingMessageReaction = await MessageReaction.findByIdAndDelete(id);
        if (deletingMessageReaction) {
            return res.status(200).json({ message: "MessageReaction deleted successfully!" });
        } else {
            return res.status(404).json({ message: "MessageReaction not found!" });

        }
    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

module.exports = {
    getMessageReactions,
    getMessageReactionById,
    createMessageReaction,
    updatedMessageReaction,
    deleteMessageReaction
}