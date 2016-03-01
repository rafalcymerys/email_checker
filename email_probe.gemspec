Gem::Specification.new do |s|
  s.name         = 'email_probe'
  s.version      = '1.0.0'
  s.date         = '2016-02-23'
  s.summary      = 'Check if email address exists on remote server'
  s.description  = 'Check if email address exists on remote server'
  s.authors      = ['Rafal Cymerys']
  s.email        = 'rafal@cymerys.com'
  s.homepage     = 'http://rubygems.org/gems/email_probe'
  s.license      = 'MIT'
  s.files        = Dir['lib/**/*']

  s.add_development_dependency('rspec', '~> 3.4')
end