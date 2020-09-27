const router = require('express').Router()
const { registerUser, loginUser, forgotPassword, getUsersById, getUsersByEmail, updateProfileUser, deleteUsers } = require('../controller/users')
const { authorizationPublic } = require('../middleware/auth')
const uploadImage = require('../middleware/multer')


router.post('/register', registerUser)
router.post('/login', loginUser)
router.get('/search', getUsersByEmail)
router.get('/:id', getUsersById)
router.patch('/:id', uploadImage, updateProfileUser)
router.delete('/:id', deleteUsers)
router.post('/forgot', forgotPassword)
module.exports = router