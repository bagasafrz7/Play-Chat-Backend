const router = require('express').Router()
const { addFriend, getAllFriend, getFriends } = require('../controller/list-friend')

router.get('/:id', getAllFriend)
router.post('/friend', addFriend)
router.get('/friends/:id', getFriends)

module.exports = router