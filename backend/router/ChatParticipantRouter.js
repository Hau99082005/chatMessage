const ChatParticipantRouter = require('express');

const {
    getChatParticipants,
    getChatParticipantById,
    createChatParticipant,
    updatedChatParticipant,
    deleteChatParticipant
} = require('../controller/ChatParticipantController');

const chatParticipantRouter = ChatParticipantRouter.Router();

chatParticipantRouter.get('/chatparticipants', getChatParticipants);
chatParticipantRouter.get('/chatparticipants/:id', getChatParticipantById);
chatParticipantRouter.post('/chatparticipants', createChatParticipant);
chatParticipantRouter.put('/chatparticipants/:id', updatedChatParticipant);
chatParticipantRouter.delete('/chatparticipants/:id', deleteChatParticipant);

module.exports = chatParticipantRouter;