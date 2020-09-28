const helper = require('../helper/index')
const { postFriend, getAllFriends, getFriendCount } = require('../model/list-friend')
const jwt = require('jsonwebtoken')
const qs = require('querystring')
const { request, response } = require('express')

module.exports = {
    getAllFriend: async (request, response) => {
        let { page, limit } = request.query
        if (page === undefined || page === '') {
            page = 1
        } else {
            page = parseInt(page)
        }

        if (limit === undefined || limit === '') {
            limit = 10
        } else {
            limit = parseInt(limit)
        }
        console.log(request.query)
        try {
            const result = await getAllFriends(page, limit);
            console.log(result)
            if (result.length > 0) {
                return helper.response(response, 200, "Success Get Friend", result)
            } else {
                return helper.response(response, 404, "Friend Not Foud", result)
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    addFriend: async (request, response) => {
        // const { user_id } = request.params
        const { user_id, friend_id } = request.body
        const setData = {
            user_id,
            friend_id
        }
        // console.log(setData)
        try {
            if (user_id === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }

            if (friend_id === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }
            const result = await postFriend(setData)
            return helper.response(response, 200, "Add Friend Created", result)
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    }
}