const router = require('express');
const { getUsers, getUserById, createUser, updatedUser, deleteUser, registerUser, loginUser } = require('../controller/UserController');

const userRouter = router.Router();

userRouter.get('/users', getUsers);
userRouter.get('/users/:id', getUserById);
userRouter.post('/users', createUser);
userRouter.put('/users/:id', updatedUser);
userRouter.delete('/users/:id', deleteUser);
userRouter.post('/register', registerUser);
userRouter.post('/login', loginUser);

module.exports = userRouter;