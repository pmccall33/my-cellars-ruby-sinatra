require 'sinatra/base'
require 'net/http'
require 'httparty'

# require controllers
require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/UserAPIController'
require './controllers/CellarController'
require './controllers/WineController'

# require models
require './models/UserModel'
require './models/CellarModel'
require './models/WineModel'
require './models/CellarWineModel'

# routes

map '/' do
  run ApplicationController
end

map '/user' do
 	run UserController
end

map '/api/v1/user' do
	run UserAPIController
end

map '/cellars' do
	run CellarController
end

map '/wines' do
	run WineController
end
