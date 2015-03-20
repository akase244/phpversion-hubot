request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
    robot.hear /phpver/i, (msg) ->
        msg.send "come1"

        options =
          url: 'http://php.net/downloads.php'
          timeout: 2000
          headers: {'user-agent': 'php version fetcher'}

        msg.send "come2"
        request options, (error, response, body) ->

            msg.send "come3"

            $ = cheerio.load body

            msg.send "come4"
            $('.release-state').each ->
                msg.send "come5"
                releaseState = $ @
                if releaseState.text() == 'Current Stable'
                    msg.send "come6"
                    msg.send releaseState.parent().attr('id')
                    msg.send "come7"
