request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
    robot.hear /phpver/i, (msg) ->

        options =
          url: 'http://php.net/downloads.php'
          timeout: 2000
          headers: {'user-agent': 'php version fetcher'}

        request options, (error, response, body) ->

        $ = cheerio.load body

        $('.release-state').each ->
            releaseState = $ @
            if releaseState.text() == 'Current Stable'
                msg.send releaseState.parent().attr('id')
