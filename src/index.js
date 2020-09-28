const route = require("express").Router()

// Route
const users = require('./routes/users');
const listFriend = require('./routes/list-friend');
// const router = require("./routes/users")

// Midle
route.use('/users', users)
route.use('/list-friend', listFriend)

module.exports = route