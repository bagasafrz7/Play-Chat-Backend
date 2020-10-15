const { request, response } = require('express')
const helper = require('../helper/index')
const { getRooms, postRoom, postRoom2, getMessage, sendMsg } = require('../model/chat')

module.exports = {
    getRoomChat: async (request, response) => {
        try {
            const { id } = request.params
            const result = await getRooms(id);
            if (result.length > 0) {
                return helper.response(response, 200, "Success Get Room Chat", result);
            } else {
                return helper.response(response, 400, "Find friends first!");
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error);
        }
    },
    addRoom: async (request, response) => {
        const { sender_id, friend_id } = request.body
        const room = Math.floor(Math.random() * 10000)
        const setData = {
            sender_id,
            friend_id,
            room_id: room
        }

        const setData2 = {
            sender_id: friend_id,
            friend_id: sender_id,
            room_id: room
        }
        try {
            if (sender_id === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }

            if (friend_id === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }
            // console.log(setData)
            // console.log(setData2)
            const result = await postRoom(setData)
            const result2 = await postRoom2(setData2)
            return helper.response(response, 200, "Add Room Success", result, result2)
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    getChatMessage: async (request, response) => {
        try {
            const { room_id } = request.body
            const result = await getMessage(room_id)

            return helper.response(response, 200, "Success Get Message", result);
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error);
        }
    },
    sendMessage: async (request, response) => {
        const { room_id, sender_id, receiver_id, message } = request.body
        const setData = {
            room_id,
            sender_id,
            receiver_id,
            message
        }
        try {
            if (room_id === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }

            if (sender_id === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }
            if (receiver_id === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }

            if (message === '') {
                return helper.response(response, 400, "Cannot Be Empty")
            }
            const result = await sendMsg(setData)
            return helper.response(response, 200, "Succes Send Message", result)
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    }
}
