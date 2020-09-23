const multer = require('multer')
const path = require('path')
const helper = require('../helper/index.js');

const storage = multer.diskStorage({
    destination: (request, file, callback) => {
        callback(null, './uploads/')
    },
    filename: (request, file, callback) => {
        callback(null, file.fieldname + '-' + new Date().toISOString().replace(/:/g, '-') + "-" + file.originalname)
    }
})

const fileFilter = (request, file, callback) => {
    const ext = path.extname(file.originalname)
    if (ext !== '.png' && ext !== '.jpg' && ext !== '.jpeg') {
        return callback(new Error('Extension File Must be PNG, JPG or JPEG'))
    }
    callback(null, true)
}

const limits = { fileSize: 1024 * 1024 * 1 }

let upload = multer({ storage: storage, fileFilter: fileFilter, limits: limits }).single('user_image')

const uploadFilter = (request, response, next) => {
    upload(request, response, function (err) {
        if (err instanceof multer.MulterError) {
            return helper.response(response, 400, err.message)
        } else if (err) {
            return helper.response(response, 400, err.message)
        }
        next()
    })
}

module.exports = uploadFilter