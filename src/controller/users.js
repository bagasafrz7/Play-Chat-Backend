const bcrypt = require('bcrypt')
const helper = require('../helper/index')
const { postUser, cekUser, getUserById, getUsersByEmail, getUsersCountByEmail, patchUser, deleteUser } = require('../model/users')
const jwt = require('jsonwebtoken')
const nodemailer = require('nodemailer')
const qs = require('querystring')
const { request, response } = require('express')

module.exports = {
    registerUser: async (request, response) => {
        const { user_fullname, user_email, user_password } = request.body
        const salt = bcrypt.genSaltSync(10)
        const encryptPassword = bcrypt.hashSync(user_password, salt)
        const setData = {
            user_fullname,
            user_email,
            user_password: encryptPassword,
            user_name: '',
            user_image: '',
            user_phone: '',
            user_bio: '',
            user_status: 1,
            user_created_at: new Date()
        }
        if (setData.user_image === '') {
            setData.user_image = 'blank-user.png'
        }
        try {
            const cekDataUser = await cekUser(user_email)
            if (user_fullname === '') {
                return helper.response(response, 400, "Name Cannot Be Empety ")
            } else if (user_email.search('@') < 0) {
                return helper.response(response, 400, "Must be a valid email address")
            } else if (user_email === '') {
                return helper.response(response, 400, "Email Cannot Be Empety")
            } else if (cekDataUser.length > 0) {
                return helper.response(response, 400, "Email is already registered! Please select another email")
            } else if (user_password.length < 8) {
                return helper.response(response, 400, "Password Must Be More Than 8 Characters")
            } else {
                const result = await postUser(setData)
                return helper.response(response, 200, "Success Register User", result)
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    loginUser: async (request, response) => {
        try {
            const { user_email, user_password } = request.body
            const cekDataUser = await cekUser(user_email)
            if (cekDataUser.length >= 1) {
                const cekPassword = bcrypt.compareSync(user_password, cekDataUser[0].user_password)
                if (cekPassword) {
                    const { user_id, user_fullname, user_email, user_name, user_image, user_phone, user_bio, user_status } = cekDataUser[0]
                    let payload = {
                        user_id,
                        user_fullname,
                        user_email,
                        user_name,
                        user_image,
                        user_phone,
                        user_bio,
                        user_status
                    }
                    if (payload.user_status === 0) {
                        return helper.response(response, 400, "Your account is currently inactive! Please check your Email")
                    } else {
                        const token = jwt.sign(payload, "PRIVASI", { expiresIn: "12h" })
                        payload = { ...payload, token }
                        return helper.response(response, 200, "Success Login!", payload)
                    }
                } else {
                    return helper.response(response, 400, "Wrong Password!")
                }
            } else {
                return helper.response(response, 400, "Email / Account not registed!")
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    getUsersById: async (request, response) => {
        try {
            const { id } = request.params
            const result = await getUserById(id)
            if (result.length > 0) {
                return helper.response(response, 200, "Success Get Users By Id", result)
            } else {
                return helper.response(response, 404, `Users By Id: ${id} Not Foud`)
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    updateProfileUser: async (request, response) => {
        // console.log(request.body);
        try {
            const { id } = request.params
            const { user_fullname, user_name, user_image, user_phone, user_bio } = request.body
            if (user_fullname === '') {
                return helper.response(response, 400, "Name Cannot Be Empety")
            }
            if (user_name === '') {
                return helper.response(response, 400, "Username Cannot Be Empety")
            }
            if (user_phone === '') {
                return helper.response(response, 400, "Number Phone Cannot Be Empety")
            } else if (user_phone.length >= 13) {
                return helper.response(response, 400, "Number Phone Cannot Be Longer than 13 Characters")
            }

            if (user_bio === '') {
                return helper.response(response, 400, "Bio Cannot Be Empety")
            }

            // const salt = bcrypt.genSaltSync(10)
            // const encryptPassword = bcrypt.hashSync(user_password, salt)
            const setData = {
                user_fullname,
                // user_email,
                // user_password: encryptPassword,
                user_name,
                user_image: request.file === undefined ? "" : request.file.filename,
                user_phone,
                user_bio,
                user_updated_at: new Date()
            }
            const checkId = await getUserById(id)
            if (checkId.length > 0) {
                if (checkId[0].user_image === 'blank-user.png' || request.file !== undefined) {
                    const result = await patchUser(setData, id)
                    return helper.response(response, 200, "Users Updated", result)
                } else {
                    fs.unlink(`./uploads/${checkId[0].user_image}`, async (error) => {
                        if (error) {
                            throw error
                        } else {
                            const result = await patchUser(setData, id)
                            return helper.response(response, 200, "Users Updated", result)
                        }
                    })
                }
            } else {
                return helper.response(response, 400, `User By Id: ${id} Not Foud`)
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    getUsersByEmail: async (request, response) => {
        let { search } = request.query
        let limit = 50
        let totalData = await getUsersCountByEmail(search)
        try {
            const result = await getUsersByEmail(search, limit)
            if (result.length > 0) {
                const newData = {
                    result,
                    totalData
                }
                return helper.response(response, 200, "Success Get Users By Email", result)
            } else {
                return helper.response(response, 404, `Users By Email: ${search} Not Foud`)
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    deleteUsers: async (request, response) => {
        try {
            const { id } = request.params
            const checkId = await getUserById(id)
            if (checkId.length > 0) {
                const result = await deleteUser(id)
                return helper.response(response, 201, "User Deleted", result)
            } else {
                return helper.response(response, 400, `User By Id: ${id} Not Foud`)
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    forgotPassword: async (request, response) => {
        try {
            const { user_email } = request.body
            const keys = Math.round(Math.random() * 10000)
            const cekDataUser = await cekUser(user_email)
            if (cekDataUser.length >= 1) {
                console.log(keys);
                // proses update keys
                let transporter = nodemailer.createTransport({
                    host: "smtp.gmail.com",
                    port: 465,
                    secure: true, // true for 465, false for other ports
                    auth: {
                        user: 'memo.aktivasi@gmail.com', // generated ethereal user
                        pass: 'Memo321123', // generated ethereal password
                    },
                });
                await transporter.sendMail({
                    from: '"Play Chat', // sender address
                    to: user_email, // list of receivers
                    subject: "Play Chat - Forgot Password", // Subject line
                    text: "Hello world?", // plain text body
                    html: `Your Code is <b>${keys}</b>`, // html body
                }), function (err) {
                    if (err) {
                        return helper.response(response, 400, 'Email not send!')
                    }
                }
                return helper.response(response, 200, 'Email has been send!')
            } else {
                return helper.response(response, 400, "Email / Account not registed!")
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    }
}