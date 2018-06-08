Gem::Specification.new do |s|
	s.name = "rwhois"
	s.version = "1.1.0"

	s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
	s.authors = ['Terin Stock', 'Patryk Szczygłowski']
	s.date = '2018-06-08'
	s.description = 'rwhois is a wrapper around `whois` to output responses in a JSON format'
	s.email = ['terin@cloudflare.com']
	s.executables = ['rwhois']
	s.files = ['rwhois.gemspec', 'bin/rwhois']
	s.homepage = 'https://www.cloudflare.com/'
	s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
	s.summary = 'A JSON wrapper for `whois`'
	s.add_runtime_dependency('multi_json', '~> 1.0')
	s.add_runtime_dependency('whois', '~>4.0')
	s.add_runtime_dependency('whois-parser', '~>1.1')
end
