const connection = require('../config/mysql')
const { request, response } = require('express')

module.exports = {
    postUser: (setData) => {
        return new Promise((resolve, reject) => {
            connection.query('INSERT INTO users SET ?', setData, (error, result) => {
                if (!error) {
                    const newResult = {
                        id: result.insertId,
                        ...setData
                    }
                    delete newResult.user_password
                    resolve(newResult)
                } else {
                    reject(new Error(error))
                }
            })
        })
    },
    cekUser: (email) => {
        return new Promise((resolve, reject) => {
            connection.query('SELECT user_id, user_fullname, user_email, user_password, user_name, user_image, user_phone, user_bio, user_status FROM users WHERE user_email = ?', email, (error, result) => {
                !error ? resolve(result) : reject(new Error(error))
            })
        })
    },
    getUserById: (id) => {
        return new Promise((resolve, reject) => {
            connection.query("SELECT * FROM users WHERE user_id = ?", id, (error, result) => {
                !error ? resolve(result) : reject(new Error(error))
            })
        })
    },
    getUserById: (id) => {
        return new Promise((resolve, reject) => {
            connection.query("SELECT * FROM users WHERE user_id = ?", id, (error, result) => {
                !error ? resolve(result) : reject(new Error(error))
            })
        })
    },
    patchUser: (setData, id) => {
        return new Promise((resolve, reject) => {
            connection.query("UPDATE users SET ? WHERE user_id = ?", [setData, id], (error, result) => {
                if (!error) {
                    const newResult = {
                        user_id: id,
                        ...setData
                    }
                    resolve(newResult)
                } else {
                    reject(new Error(error))
                }
            })
        })
    }
}