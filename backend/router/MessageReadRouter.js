const router = require('express');
const {
    getMessageRead,
    getMessageReadById,
    createMessageRead,
    updatedMessageRead,
    deleteMessageRead
} = require('../controller/MessageReadController');

const messageReadRouter = router.Router();

messageReadRouter.get('/messagereads', getMessageRead);
messageReadRouter.get('/messagereads/:id', getMessageReadById);
messageReadRouter.post('/messagereads', createMessageRead);
messageReadRouter.put('/messagereads/:id', updatedMessageRead);
messageReadRouter.delete('/messagereads/:id', deleteMessageRead);

module.exports = messageReadRouter;