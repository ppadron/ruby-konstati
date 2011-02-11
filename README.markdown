# Konstati Ruby API Client

Konstati is a service that performs realtime antispam tests agains HTML email
messages. Its main purpose is to provide means to email marketers to verify
their campaigns before actually sending them.

As of the date of this document, the only available antispam test is based on
Spamassassin.

This library provides access to the API just like any other activeresource
client library.

## Installation

Use RubyGems to install this library:

    $ gem install konstati

## Authentication

Konstati uses HTTP basic authentication, which can be setup using:

    Konstati::Base.authenticate(:username => "user", :password => "password")

## Spamassassin Tests

### Create a New Test

This is a sample request:

    result = Konstati::Tests::Spamassassin.create(
      :bodyHtml  => "<p>Hello World</p>",  # required
      :bodyText  => "Hello World",         # optional
      :subject   => "Free stuff!",         # required
      :fromEmail => "email@example.com",   # required
      :fromName  => "John Doe",            # required
      :lang      => "pt_BR",               # required
      :customer  => "mycustomerlogin"      # optional
    )

The result will contain the following data:

    id           # (String)  unique test id, you can use this to query it
    isSpam       # (Boolean) if the message is spam or not (thresold: 7.0 points)
    lang         # (String)  language used on the results
    score        # (Float)   total spam score for the message
    customer     # (String)  optional customer name/login
    message      # (Message) contains all message-related parameters specified in the request
    status       # (String)  status of the spam test (done/processing/error/cancelled)
    testDuration # (Float)   time it took for the test to be processed (in seconds)
    matchedRules # (Array)   this Array contains all matched Spamassassin rules,
                 #           where each object contains "ruleName", "description",
                 #           "score" and "tips" (may be empty)

### Get a Test Result

    result = Konstati::Tests::Spamassassin.find("4d54f05b898d2994e41dde8b")

### List Test Results

    results = Konstati::Tests::Spamassassin.find(:all, :params => {})

Optional parameters in :params may be used to filter results. Available parameters are **lang**,
**status** and **customer**. Each parameter can be used alone or in a combination with other(s).

Here are some examples:

    # all tests performed by "johndoe"
    results = Konstati::Tests::Spamassassin.find(:all, :params => {:customer => "johndoe"})

    # all tests in pt_BR by "johndoe"
    results = Konstati::Tests::Spamassassin.find(:all, :params => {:customer => "johndoe", :lang => "pt_BR"})
    
    # all tests with "done" status in "en_EN"
    results = Konstati::Tests::Spamassassin.find(:all, :params => {:status => "done", :lang => "en_EN"})

You can also perform pagination using **perPage** and **pageNumber** parameters. Default behavior is to
return the first 20 results. These parameters can also be used together with filters:

    # give me 40 tests performed by "johndoe" in pt_BR
    results = Konstati::Tests::Spamassassin.find(:all, :params => {:lang => "en_EN", :perPage => 40, :customer => "johndoe"})
