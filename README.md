# Email Probe

[![Build Status](https://travis-ci.org/rafalcymerys/email_probe.svg?branch=master)](https://travis-ci.org/rafalcymerys/email_probe)
[![Code Climate](https://codeclimate.com/github/rafalcymerys/email_checker/badges/gpa.svg)](https://codeclimate.com/github/rafalcymerys/email_checker)

Email Probe lets you check if an email account exists on remote server.

## Installation

```
gem install email_probe
```

## Usage

```ruby
require 'email_probe`

checker = EmailProbe::Checker.new('me@example.org')
if checker.check('test@example.org')
  puts 'Correct!'
end
```

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b feature/my-new-feature)
2. Commit your changes (git commit -am 'Add a new cool feature')
3. Push to the branch (git push origin feature/my-new-feature)
3. Create a new Pull Request to branch master.
