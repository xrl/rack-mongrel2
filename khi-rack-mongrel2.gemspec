## This is the rakegem gemspec template. Make sure you read and understand
## all of the comments. Some sections require modification, and others can
## be deleted if you don't need them. Once you understand the contents of
## this file, feel free to delete any comments that begin with two hash marks.
## You can find comprehensive Gem::Specification documentation, at
## http://docs.rubygems.org/read/chapter/20
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'khi-rack-mongrel2'
  s.version           = '1.0.3'
  s.date              = '2011-05-21'
  s.rubyforge_project = 'khi-rack-mongrel2'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = %Q{One of many Mongrel2 Rack handler you'll probably try.}
  s.description = %Q{A Rack handler for the Mongrel2 web server, by Zed Shaw. http://mongrel2.org/}

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ['Daniel Huckstep', 'Nathan Duran']
  s.email    = 'darkhelmet@darkhelmetlive.com'
  s.homepage = 'https://github.com/khiltd/rack-mongrel2'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_dependency('zmq', ['~> 2.1.4'])

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency('rspec', ['~> 2.3.0'])
  s.add_development_dependency('fuubar', ['~> 0.0.3'])
  s.add_development_dependency('yard', ['~> 0.6.4'])

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    Gemfile
    LICENSE
    README.md
    Rakefile
    example/sinatra/.gitignore
    example/sinatra/Gemfile
    example/sinatra/Gemfile.lock
    example/sinatra/app.rb
    example/sinatra/config.ru
    example/sinatra/mongrel2.conf
    khi-rack-mongrel2.gemspec
    lib/khi-rack-mongrel2.rb
    lib/mongrel2/connection.rb
    lib/mongrel2/request.rb
    lib/mongrel2/response.rb
    lib/rack/handler/mongrel2.rb
    spec/request_spec.rb
    spec/response_spec.rb
    spec/spec.opts
    spec/spec_helper.rb
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^spec\/.*_spec\.rb/ }
end