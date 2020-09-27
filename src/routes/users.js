const router = require('express').Router()
const { registerUser, loginUser, forgotPassword, getUsersById, getUsersByEmail, updateProfileUser } = require('../controller/users')
const { authorizationPublic } = require('../middleware/auth')
const uploadImage = require('../middleware/multer')


router.post('/register', registerUser)
router.post('/login', loginUser)
router.get('/search', getUsersByEmail)
router.get('/:id', getUsersById)
router.patch('/:id', authorizationPublic, uploadImage, updateProfileUser)
router.post('/forgot', forgotPassword)
module.exports = router