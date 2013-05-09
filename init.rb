ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

#to-do
#dynamically load all css and javascript in the layout

require 'rubygems'  
require 'bundler'

Bundler.setup

require 'date'
require 'open-uri'
require 'haml'
require 'json'
require 'sass/plugin/rack'
#require 'mongo'
#require 'mongo_mapper'  
#require 'bson'
require 'sinatra/base'
require 'sinatra/reloader'

# Connect to mongo database.
#MongoMapper.connection = Mongo::Connection.new                                                                                                                                           
#MongoMapper.database = 'fuelThrottleRuby-db'

# Load all application files.
Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each do |file|
  require file
end

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

class Main < Sinatra::Base
	#For Security enable rack sessions
	use Rack::Session::Pool

	set :app_file, __FILE__ 
	set :haml, { :format => :html5 }
	set :protection, :except => [:frame_options,:http_origin]
	use Sass::Plugin::Rack

	configure do
	end

	configure :development do
		register Sinatra::Reloader
	end
end

Main.run! if Main.run?
