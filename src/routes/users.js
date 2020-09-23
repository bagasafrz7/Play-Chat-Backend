const router = require('express').Router()
const { registerUser, loginUser, forgotPassword, updateProfileUser } = require('../controller/users')
const { authorizationPublic } = require('../middleware/auth')
const uploadImage = require('../middleware/multer')


router.post('/register', registerUser)
router.post('/login', loginUser)
router.patch('/:id', authorizationPublic, uploadImage, updateProfileUser)
router.post('/forgot', forgotPassword)
module.exports = router