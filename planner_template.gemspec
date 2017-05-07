Gem::Specification.new do |s|
  s.name = 'planner_template'
  s.version = '0.1.0'
  s.summary = 'Base class for generating an HTML based weekly planner etc.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/planner_template.rb']
  s.add_runtime_dependency('nokorexi', '~> 0.3', '>=0.3.1')
  s.signing_key = '../privatekeys/planner_template.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/planner_template'
end
