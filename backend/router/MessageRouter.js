const MessageRouter = require('express');
const {
    getMessages,
    getMessageById,
    createMessage,
    updatedMessage,
    deleteMessage,
    getAllMessages
} = require('../controller/MessageController');

const messageRouter = MessageRouter.Router();

messageRouter.get('/messages/:chatId', getMessages);
messageRouter.get('/messages/:messageId', getMessageById);
messageRouter.post('/messages', createMessage);
messageRouter.put('/messages/:id', updatedMessage);
messageRouter.delete('/messages/:id', deleteMessage);
messageRouter.get('/messages', getAllMessages);


module.exports = messageRouter;