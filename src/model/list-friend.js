const connection = require('../config/mysql')

module.exports = {
    getAllFriends: (id) => {
        return new Promise((resolve, reject) => {
            connection.query(`SELECT list_friend.friend_id, users.user_fullname, users.user_name, users.user_image, users.user_phone, users.user_bio from list_friend JOIN users ON list_friend.friend_id = users.user_id WHERE list_friend.user_id = ?`, id, (error, result) => {
                !error ? resolve(result) : reject(new Error(error))
            })
        })
    },
    postFriend: (setData) => {
        return new Promise((resolve, reject) => {
            connection.query("INSERT INTO list_friend set ?", setData, (error, result) => {
                if (!error) {
                    const newResult = {
                        id_list_friend: result.insertId,
                        ...setData
                    }
                    resolve(newResult)
                } else {
                    reject(new Error(error))
                }
            })
        })
    },
    getFriendCount: () => {
        return new Promise((resolve, reject) => {
            connection.query("SELECT COUNT(*) as total FROM list-friend", (error, result) => {
                !error ? resolve(result[0].total) : reject(new Error(error))
            })
        })
    },
}
