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

	end

	# show wine page
	get '/:id/show' do
		@wine = Wine.find_by id: params[:id]

		erb :wine_show
	end

	# create/ POST route
	post '/' do

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

    	redirect '/wines'

	end

	get '/:id/trends' do
		@wine = Wine.find_by id: params[:id]

		post_req = HTTParty.post("http://localhost:8080/trends", 
			body: { 
				keyword_one: @wine.winemaker, 
				keyword_two: @wine.wine_name, 
				keyword_three: "natural wine" 
			}
		)
		# puts "@wine_trends_data -------======"
		# puts @wine_trends_data = post_req["default"]["timelineData"][80]["value"]
		
		# get the last 8ish years of value Data for the wine		
		@wine_trends_data = []
		data_points = (80..((post_req["default"]["timelineData"].length) - 1)).to_a
		puts data_points.class

		data_points.each do |dp|
			# puts post_req["default"]["timelineData"][dp]["value"].class
			@wine_trends_data.push(post_req["default"]["timelineData"][dp]["value"])
		end

		puts "@wine_trends_data <---=-=-=--=<<"
		pp @wine_trends_data
		erb :wine_trends
	end



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