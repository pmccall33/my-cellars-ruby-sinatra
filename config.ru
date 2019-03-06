require 'sinatra/base'

# require controllers
require './controllers/ApplicationController'
# require './controllers/UserController'
# require './controllers/UserAPIController'
# require './controllers/CellarController'
# require './controllers/WineController'

# require models
require './models/UserModel'
require './models/CellarModel'
require './models/WineModel'

# routes

map '/' do
  run ApplicationController
end

# map '/user' do
#  	run UserController
# end

# map '/cellar' do
# 	run CellarController
# end

# map '/wine' do
# 	run WineController
# end
