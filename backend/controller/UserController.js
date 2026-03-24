const bcrypt = require('bcryptjs');
const User = require('../models/User');
const jwt = require('jsonwebtoken');

const getUsers = async(req, res) => {
    try {
        const users = await User.find({}).select('-password');
        if (!users) {
            return res.status(404).json({ message: 'No users found' });
        } else {
            return res.status(200).json(users);
        }

    } catch (error) {
        res.status(500).json({ message: 'Internal Server Error' });
    }
}

const getUserById = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: 'User ID is required' });
    }
    try {
        const user = await User.find({ _id: id }).select('-password');
        if (!user) {
            return res.status(400).json({ message: 'User not found!' });
        } else {
            return res.status(200).json(user);
        }

    } catch (error) {
        return res.status(500).json({ message: 'Internal Server Error' });
    }
}

const createUser = async(req, res) => {
    const { username, email, password, avatar, bio } = req.body;
    if (!username || !email || !password || !avatar || !bio) {
        return res.status(400).json({ message: 'Username, email and password are required' });
    }
    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);
        const newUser = new User({
            username,
            email,
            password: hashedPassword,
            avatar,
            bio
        });
        await newUser.save();
        if (!newUser) {
            return res.status(400).json({ message: 'User creation failed!' });
        } else {
            return res.status(201).json({ message: 'User created successfully!' }, newUser);
        }

    } catch (error) {
        return res.status(500).json({ message: 'Internal Server Error' });
    }
}

const updatedUser = async(req, res) => {
    const { id } = req.params;
    const { username, email, password, avatar, bio } = req.body;
    if (!id) {
        return res.status(400).json({ message: 'User ID is required' });
    }
    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);
        const updatedUser = await User.findByIdAndUpdate(id, {
            username,
            email,
            password: hashedPassword,
            avatar,
            bio
        }, { new: true });
        if (!updatedUser) {
            return res.status(400).json({ message: 'User update failed because user not found!' });
        } else {
            return res.status(200).json({ message: 'User updated successfully!' }, updatedUser);
        }

    } catch (error) {
        return res.status(500).json({ message: 'Internal Server Error' });
    }
}

const deleteUser = async(req, res) => {
    const { id } = req.params;
    if (!id) {
        return res.status(400).json({ message: 'User ID is required' });
    }
    try {
        const deletedUser = await User.findByIdAndDelete(id);
        if (!deleteUser) {
            return res.status(400).json({ message: 'User deletion failed because user not found!' });
        } else {
            return res.status(200).json({ message: 'User deleted successfully!' }, deletedUser);
        }

    } catch (error) {
        return res.status(500).json({ message: 'Internal Server Error' });
    }
}

const getAllUsers = async(req, res) => {
    try {
        const users = await User.find({}).select('-password');
        if (!users) {
            return res.status(404).json({ message: 'No users found!' });
        } else {
            return res.status(200).json(users);
        }

    } catch (error) {
        return res.status(500).json({ message: 'Internal Server Error' });
    }
}

const loginUser = async(req, res) => {
    try {
        const { email, password } = req.body;
        const findUser = await User.findOne({ email });
        if (!findUser) {
            return res.status(400).json({ message: 'Invalid email or password!' });
        } else {
            const isMatch = await bcrypt.compare(password, findUser.password);
            if (!isMatch) {
                return res.status(400).json({ message: 'Incorrect password!' });
            } else {
                const token = jwt.sign({ id: findUser._id }, "passwordKey", { expiresIn: '1h' });
                const { password, ...userWithoutPassword } = findUser._doc;
                return res.status(200).json({ message: 'Đăng nhập thành công!', token, user: userWithoutPassword });
            }
        }
    } catch (e) {
        return res.status(500).json({ e: e.message });
    }

}

const registerUser = async(req, res) => {
    const { username, email, password } = req.body;
    if (!username || !email || !password) {
        return res.status(400).json({ message: 'Username, email and password are required!' });
    }
    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);
        const newUser = new User({
            username,
            email,
            password: hashedPassword
        });
        await newUser.save();
        if (!newUser) {
            return res.status(400).json({ message: 'User registration failed!' });
        } else {
            return res.status(201).json({ message: 'User registered successfully!' }, newUser);
        }

    } catch (error) {
        return res.status(500).json({ message: 'Internal Server Error!' });
    }
}

module.exports = {
    getUsers,
    getUserById,
    createUser,
    updatedUser,
    deleteUser,
    getAllUsers,
    loginUser,
    registerUser
}