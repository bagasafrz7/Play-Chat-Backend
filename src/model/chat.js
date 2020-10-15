const connection = require('../config/mysql')

module.exports = {
    getRooms: (id) => {
        return new Promise((resolve, reject) => {
            connection.query(`SELECT * from room_chat JOIN users ON room_chat.friend_id = users.user_id WHERE room_chat.sender_id = ?`, id, (error, result) => {
                !error ? resolve(result) : reject(new Error(error));
                // console.log(error)
            })
        })
    },
    postRoom: (setData) => {
        return new Promise((resolve, reject) => {
            connection.query("INSERT INTO room_chat set ?", setData, (error, result) => {
                if (!error) {
                    const newResult = {
                        id_roomchat: result.insertId,
                        ...setData
                    }
                    resolve(newResult)
                } else {
                    reject(new Error(error))
                }
            })
        })
    },
    postRoom2: (setData) => {
        return new Promise((resolve, reject) => {
            connection.query("INSERT INTO room_chat set ?", setData, (error, result) => {
                if (!error) {
                    const newResult = {
                        id_roomchat: result.insertId,
                        ...setData
                    }
                    resolve(newResult)
                } else {
                    reject(new Error(error))
                }
            })
        })
    },
    getMessage: (id) => {
        return new Promise((resolve, reject) => {
            connection.query(`SELECT * from messages JOIN users ON messages.receiver_id = users.user_id WHERE messages.room_id = ?`, id, (error, result) => {
                !error ? resolve(result) : reject(new Error(error));
                // console.log(error)
            })
        })
    },
    sendMsg: (setData) => {
        return new Promise((resolve, reject) => {
            connection.query("INSERT INTO messages set ?", setData, (error, result) => {
                if (!error) {
                    const newResult = {
                        id_roomchat: result.insertId,
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
