const route = require("express").Router()

// Route
const users = require('./routes/users');
const listFriend = require('./routes/list-friend');
const chat = require('./routes/chat');
// const router = require("./routes/chat");
// const router = require("./routes/users")

// Midle
route.use('/users', users)
route.use('/list-friend', listFriend)
route.use('/chat', chat)

module.exports = route