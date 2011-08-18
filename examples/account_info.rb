require '../lib/konstati'
require '../lib/konstati/account'

Konstati.username = ''
Konstati.apikey   = ''

info = Konstati::Account.info

credits = info['rateLimit']['max'] - info['rateLimit']['current']

puts "I still have #{credits} credits left." 