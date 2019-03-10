class WineController < ApplicationController


	# test route
	get '/test' do
		"You have reached test route, Pedro"
	end

	# index route
	get '/' do
		"wine index route"
		@wines = Wine.all.sort
		erb :wine_index
	end


	# new route
	get '/new' do
		erb :wine_new
	end


	# get wine by :id route
	get '/:id' do
		@wine = Wine.find_by id: params[:id]
		puts @wine
		puts @wine.winemaker

	end

	# show wine page
	get '/:id/show' do
		puts "wines/:id/show route reached"
		@wine = Wine.find_by id: params[:id]
		puts @wine
		puts @wine.winemaker

		erb :wine_show
	end

	# create/ POST route
	post '/' do
		puts "You have hit the POST route, congrats"
		puts "#{params} params from create wine PUST route......"
		wine = Wine.new

		wine.wine_name = params[:wine_name]
		wine.winemaker = params[:winemaker]
		wine.wine_region = params[:wine_region]
		wine.wine_varietals  = params[:wine_varietals]
		wine.wine_vintage = params[:wine_vintage]
		wine.wine_image_url = params[:wine_image_url]
		wine.wine_link = params[:wine_link]
		wine.wine_notes = params[:wine_notes]

    	wine.save

    	puts "#{wine} created wine is here-----"
    	redirect '/wines'

	end

	get '/:id/trends' do
		puts "POST route at /trends hit!"
		puts "#{params} params are thus"

		response = HTTParty.get('http://localhost:8080/trends')
		puts "response.code from localhost:8080 <----======------<<<"
		pp response.code
		# get the word the user wants to search for from the params
    	# give that word to an instance of the Giph class to send a request to the API
    	#  and get a response
    	# render the template that will show the user that response

		erb :wine_trends
	end

	# CREATE TABLE wines(
	# id SERIAL PRIMARY KEY,
	# wine_name VARCHAR(63),
	# winemaker VARCHAR(63),
	# wine_region VARCHAR(63),
	# wine_varietals VARCHAR(127),
	# wine_vintage SMALLINT,
	# wine_image_url TEXT,
	# wine_link VARCHAR(255),
	# wine_notes TEXT
	# );


	put '/:id' do
		puts "put /:id route reached....."
		wine = Wine.find params[:id]
		puts wine

		wine.wine_name = params[:wine_name]
		wine.winemaker = params[:winemaker]
		wine.wine_region = params[:wine_region]
		wine.wine_varietals  = params[:wine_varietals]
		wine.wine_vintage = params[:wine_vintage]
		wine.wine_image_url = params[:wine_image_url]
		wine.wine_link = params[:wine_link]
		wine.wine_notes = params[:wine_notes]
		
		wine.save

		redirect '/wines'
	end


	get '/:id/edit' do
		@wine = Wine.find_by id: params[:id]

		# puts @wine
		erb :wine_edit
	end


	delete '/:id' do
		wine = Wine.find params[:id]
		pp wine

		# DESTROY IT!!!!!
		wine.destroy

		redirect '/wines'

	end

end