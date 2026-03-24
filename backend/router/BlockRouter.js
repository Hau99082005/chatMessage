const blockrouter = require('express');
const {
    getBlock,
    getBlockById,
    createBlock,
    updatedBlock,
    deleteBlock
} = require('../controller/BlockController');

const BlockRouter = blockrouter.Router();

BlockRouter.get('/blocks', getBlock);
BlockRouter.get('/blocks/:id', getBlockById);
BlockRouter.post('/blocks', createBlock);
BlockRouter.put('/blocks/:id', updatedBlock);
BlockRouter.delete('/blocks/:id', deleteBlock);


module.exports = BlockRouter;