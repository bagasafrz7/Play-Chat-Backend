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
    getUsersByEmail: (search, limit) => {
        return new Promise((resolve, reject) => {
            connection.query(`SELECT user_id, user_fullname, user_email, user_name, user_image, user_phone, user_bio, user_status, user_key, user_created_at, user_updated_at FROM users WHERE user_email LIKE ? LIMIT ?`, [`%${search}%`, limit], (error, result) => {
                !error ? resolve(result) : reject(new Error(error))
            })
        })
    },
    getUserById: (id) => {
        return new Promise((resolve, reject) => {
            connection.query("SELECT user_id, user_fullname, user_email, user_name, user_image, user_phone, user_bio, user_status, user_key, user_created_at, user_updated_at FROM users WHERE user_id = ?", id, (error, result) => {
                !error ? resolve(result) : reject(new Error(error))
            })
        })
    },
    getUsersCountByEmail: (search) => {
        return new Promise((resolve, reject) => {
            connection.query('SELECT COUNT(*) as total FROM users WHERE user_email LIKE ?', `%${search}%`, (error, result) => {
                !error ? resolve(result[0].total) : reject(new Error(error))
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
    },
    deleteUser: (id) => {
        return new Promise((resolve, reject) => {
            connection.query("DELETE FROM users where user_id = ?", id, (error, result) => {
                if (!error) {
                    const newResult = {
                        id: id
                    }
                    resolve(newResult)
                } else {
                    reject(new Error(error))
                }
            })
        })
    }
}