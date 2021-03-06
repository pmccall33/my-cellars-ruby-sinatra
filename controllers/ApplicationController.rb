class ApplicationController < Sinatra::Base
	require 'bundler'
	Bundler.require()

	Dotenv.load

	# envoronment config
	require './config/environments'

	# enable :sessions
	secret = ENV['SESSION_SECRET']

	use Rack::Session::Cookie, :key => 'rack.session',
                               :path => '/',
    						   :secret => secret

    # Set up CORS
	register Sinatra::CrossOrigin

	configure do
		enable :cross_origin
	end

	set :allow_origin, :any
	set :allow_methods, [:get, :post, :put, :options, :patch, :delete, :head]
	set :allow_credentials, true                        
    
    # middleware here
    use Rack::MethodOverride
  	set :method_override, true

	# find templates
	set :views, File.expand_path('../../views', __FILE__)

	# find static assets
	set :public_dir, File.expand_path('../../public', __FILE__)

	#browser options
	options "*" do 
		response.headers["Allow"] = "HEAD,GET,PUT,PATCH,POST,DELETE,OPTIONS" 
		response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
		200
	end

	get '/' do 
		erb :index
	end

	get '/test' do	
		"reached test route"

		if ENV['RACK_ENV'] == "development"
			binding.pry
		end

		redirect '/'
	end

	get '*' do
		halt 404
	end
end