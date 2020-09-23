const jwt = require('jsonwebtoken')
const helper = require('../helper')

module.exports = {
    authorizationPublic: (request, response, next) => {
        let token = request.headers.authorization
        if (token) {
            token = token.split(" ")[1]
            jwt.verify(token, "PRIVASI", (error, result) => {
                if (
                    (error && error.name === "JsonWebTokenError") ||
                    (error && error.name === "TokenExpiredError")
                ) {
                    return helper.response(response, 403, error.message)
                } else {
                    request.token = result
                    next()
                }
            })
        } else {
            return helper.response(response, 400, "Please Login First!")
        }
    }
}