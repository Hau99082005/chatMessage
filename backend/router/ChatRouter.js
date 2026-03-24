const chatRouter = require('express');
const {
    getUserChats,
    getChatById,
    createChat,
    updatedChat,
    deleteChat,
    getChat
} = require('../controller/ChatController');


const chatRouterInsance = chatRouter.Router();

chatRouterInsance.get('/chats/user/:userId', getUserChats);
chatRouterInsance.get('/chats/:id', getChatById);
chatRouterInsance.post('/chats', createChat);
chatRouterInsance.put('/chats/:id', updatedChat);
chatRouterInsance.delete('/chats/:id', deleteChat);
chatRouterInsance.get('/chats', getChat);

module.exports = chatRouterInsance;