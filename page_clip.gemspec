Gem::Specification.new do |s|
  s.name        = 'page_clip'
  s.version     = '1.0.0'
  s.date        = '2015-08-18'
  s.summary     = 'Pagination calculator'
  s.description = 'Calculates pages to display in a paginator'
  s.authors     = ['Mert Guldur']
  s.email       = 'mertguldur@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.license     = 'MIT'

  s.add_development_dependency 'rspec', '~> 3.0'
end
