const AttachmentRouter = require('express');

const {
    getAttachments,
    getAttachmentsById,
    createAttachment,
    updatedAttachment,
    deleteAttachment
} = require('../controller/AttachmentController');

const attachmentRouterInstance = AttachmentRouter.Router();

attachmentRouterInstance.get('/atachments', getAttachments);
attachmentRouterInstance.get('/atachments/:id', getAttachmentsById);
attachmentRouterInstance.post('/atachments', createAttachment);
attachmentRouterInstance.put('/atachments/:id', updatedAttachment);
attachmentRouterInstance.delete('/atachments/:id', deleteAttachment);

module.exports = attachmentRouterInstance;