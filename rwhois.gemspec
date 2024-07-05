Gem::Specification.new do |s|
	s.name = "rwhois"
	s.version = "1.3.0"

	s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
	s.authors = ['Terin Stock', 'Patryk Szczygłowski']
	s.date = '2024-08-05'
	s.description = 'rwhois is a wrapper around `whois` to output responses in a JSON format'
	s.email = ['terin@cloudflare.com']
	s.executables = ['rwhois']
	s.files = ['rwhois.gemspec', 'bin/rwhois']
	s.homepage = 'https://www.cloudflare.com/'
	s.required_ruby_version = Gem::Requirement.new(">= 2.7")
	s.summary = 'A JSON wrapper for `whois`'
	s.add_runtime_dependency('multi_json', '~> 1')
	s.add_runtime_dependency('whois', '~> 5')
	s.add_runtime_dependency('whois-parser', '~> 2')
	s.add_runtime_dependency('activesupport', '~> 7.0.8')
end
