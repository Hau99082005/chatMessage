const Block = require('../models/Block');


const getBlock = async(req, res) => {
    try {
        const block = await Block.find({}).sort({ createdAt: -1 });
        if (!block) {
            return res.status(400).json({ message: "Bad request!" });
        } else {
            return res.status(200).json(block);
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const getBlockById = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Block ID is required!" });
    }
    try {
        const block = await Block.findById(id);
        if (block) {
            return res.status(200).json({ message: "Block get successfully!", data: block });
        } else {
            return res.status(404).json({ message: "Block not found!" });
        }

    } catch (error) {
        res.status(500).json({ message: "Internal Server Error" });
    }
}

const createBlock = async(req, res) => {
    const { blocker, blocked } = req.body;
    if (!blocker || !blocked) {
        return res.status(400).json({ message: "Blocker and Blocked are required!" });
    }
    try {
        const newBlock = new Block({
            blocker,
            blocked
        });
        const savedBlock = await newBlock.save();
        if (savedBlock) {
            return res.status(201).json({ message: 'Block created successfully!', data: savedBlock });
        } else {
            return res.status(400).json({ message: 'Failed to create block!' });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const updatedBlock = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Block ID is required!" });
    }
    try {
        const block = await Block.findIdAndUpdate(id, req.body, { new: true });
        if (block) {
            return res.status(200).json({ message: "Block updated successfully!", data: block });
        } else {
            return res.status(404).json({ message: "Block not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}

const deleteBlock = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: "Block ID is required!" });
    }
    try {
        const block = await Block.findByIdAndDelete(id);
        if (block) {
            return res.status(200).json({ message: "Block deleted successfully!", data: block });
        } else {
            return res.status(404).json({ message: "Block not found!" });
        }

    } catch (error) {
        return res.status(500).json({ message: "Internal Server Error" });
    }
}


module.exports = {
    getBlock,
    getBlockById,
    createBlock,
    updatedBlock,
    deleteBlock
}