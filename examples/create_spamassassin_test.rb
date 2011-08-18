require '../lib/konstati'

Konstati.username = ''
Konstati.apikey   = ''

test = Konstati::Test.create(
  :type      => "spamassassin",
  :bodyHtml  => "<p>Hello World</p>",
  :bodyText  => "Hello World",
  :subject   => "CHEAP VIAGRA!!!!",
  :fromEmail => "email@example.com",
  :fromName  => "John Doe",
  :lang      => "pt",
  :customer  => "mycustomerlogin"
)

puts "This email has scored #{test['result']['score']} points in SpamAssassin."
