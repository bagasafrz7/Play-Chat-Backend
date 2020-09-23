const route = require("express").Router()

// Route
const users = require('./routes/users')

// Midle
route.use('/users', users)

module.exports = route