const messageReactionRouter = require('express');

const {
    getMessageReactions,
    getMessageReactionById,
    createMessageReaction,
    updatedMessageReaction,
    deleteMessageReaction
} = require('../controller/MessageReactionController');

const MessageReactionRouter = messageReactionRouter.Router();


MessageReactionRouter.get('/messagereactions', getMessageReactions);
MessageReactionRouter.get('/messagereactions/:id', getMessageReactionById);
MessageReactionRouter.post('/messagereactions', createMessageReaction);
MessageReactionRouter.put('/messagereactions/:id', updatedMessageReaction);
MessageReactionRouter.delete('/messagereactions/:id', deleteMessageReaction);

module.exports = MessageReactionRouter;