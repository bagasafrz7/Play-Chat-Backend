const router = require('express').Router()
const { addFriend, getAllFriend } = require('../controller/list-friend')

router.get('/', getAllFriend)
router.post('/friend', addFriend)

module.exports = router