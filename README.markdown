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

    Konstati.username = "user"
    Konstati.apikey   = "apikey"

If authentication fails, Konstati will return 401 Unauhtorized.

## Spamassassin Tests

### Create a New Test

This is a sample request:

    result = Konstati::Tests.create(
      :bodyHtml  => "<p>Hello World</p>",  # required
      :bodyText  => "Hello World",         # optional
      :subject   => "Free stuff!",         # required
      :fromEmail => "email@example.com",   # required
      :fromName  => "John Doe",            # required
      :customer  => "mycustomerlogin"      # optional
    )

The result will contain the following data:

    id            # (String)  unique test id, you can use this to query it later
    emailMessage  # (Hash)    contains all message-related parameters specified in the request
    customer      # (String)  optional customer name/login supplied in the request
    lang          # (String)  language used on the results
    type          # (String)  type of test (currently only spamassassin)
    status        # (String)  status of the spam test (done/processing/error/cancelled)
    startedAt     # (Float)   when the test was started (in seconds)
    updatedAt     # (Float)   when the test was last updated (in seconds)
    totalRuntime  # (Float)   time it took for the test to be processed (in seconds)
    result        # (Hash)    contains all test result fields (score, isSpam, matchedRules)

### Get a Test Result

    result = Konstati::Tests.find("4d54f05b898d2994e41dde8b")

If test does not exist, 404 Not Found will be raised.

### List Test Results

    results = Konstati::Tests.find(:params => {})

Optional parameters in :params may be used to filter results. Available parameters are **lang**,
**status** and **customer**. Each parameter can be used alone or with other(s).

Here are some examples:

    # all tests performed by "johndoe"
    results = Konstati::Tests.find(:params => {:customer => "johndoe"})

    # all tests in pt by "johndoe"
    results = Konstati::Tests.find(:params => {:customer => "johndoe", :lang => "pt"})
    
    # all tests with "done" status in "en"
    results = Konstati::Tests  .find(:params => {:status => "done", :lang => "en"})

You can also perform pagination using **perPage** and **pageNumber** parameters. Default behavior is to
return the first 20 results. These parameters can also be used together with filters:

    # give me 40 tests performed by "johndoe" in pt
    results = Konstati::Tests.find(:params => {:lang => "en", :perPage => 40, :customer => "johndoe"})
