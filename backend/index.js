require('dotenv').config();
const express = require('express');
const PORT = 3000;
const app = express();
const dbConnect = require('./lib/dbconnect');
const userRouter = require('./router/userRouter');
const messageReadRouter = require('./router/MessageReadRouter');
const messageReactionRouter = require('./router/MessageReactionRouter');
const messageRouter = require('./router/MessageRouter');
const chatParticipantRouter = require('./router/ChatParticipantRouter');
const chatRouter = require('./router/ChatRouter');
const blockRouter = require('./router/BlockRouter');
const attachmentRouter = require('./router/AttachmentRouter');


app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));
app.use('/api', userRouter);
app.use('/api', messageReadRouter);
app.use('/api', messageReactionRouter);
app.use('/api', messageRouter);
app.use('/api', chatParticipantRouter);
app.use('/api', chatRouter);
app.use('/api', blockRouter);
app.use('/api', attachmentRouter);

dbConnect();

app.get('/', (req, res) => {
    res.status(200).json({ message: 'Hello, World!' });
})



app.listen(PORT, "0.0.0.0", function() {
    console.log(`Server is running on port ${PORT}`);
})