const router = require('express').Router()
const { addFriend, getAllFriend } = require('../controller/list-friend')

router.get('/:id', getAllFriend)
router.post('/friend', addFriend)

module.exports = router