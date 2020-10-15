const router = require('express').Router()
const { getRoomChat, addRoom, getChatMessage, sendMessage } = require('../controller/chat')

router.get('/:id', getRoomChat)
router.post('/room', addRoom)
router.post('/message', getChatMessage)
router.post('/send', sendMessage)

module.exports = router
