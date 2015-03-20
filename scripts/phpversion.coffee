request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
    robot.hear /phpver/i, (msg) ->
        msg.send 'come'
