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

		post_req_one = HTTParty.post("http://wine-express-api.herokuapp.com/trends", 
			body: { 
				keyword_one: @wine.winemaker, 
				keyword_two: @wine.wine_name, 
				keyword_three: "natural wine" 
			}
		)

		post_req_two = HTTParty.post("http://wine-express-api.herokuapp.com/trends/winemaker",
			body: {
				keyword_one: @wine.winemaker, 
				keyword_two: @wine.wine_name
			}
		)

		# get 4 ish years of trending data 'natural wine'	
		@wine_trends_data_one = []
		data_points_one = (120..((post_req_one["default"]["timelineData"].length) - 1)).to_a

		data_points_one.each do |dp|
			@wine_trends_data_one.push(post_req_one["default"]["timelineData"][dp]["value"][0])
		end

		# get 4 ish years of trending data for winemaker
		@wine_trends_data_two = []
		data_points_two = (120..((post_req_two["default"]["timelineData"].length) - 1)).to_a

		data_points_two.each do |dp|
			@wine_trends_data_two.push(post_req_two["default"]["timelineData"][dp]["value"][0])
		end

		puts "@wine_trends_data <---=-=-=--=<<"
		pp @wine_trends_data_one
		pp @wine_trends_data_two
		erb :wine_trends
	end



	put '/:id' do
		@wine = Wine.find params[:id]
		puts @wine

		@wine.wine_name = params[:wine_name]
		@wine.winemaker = params[:winemaker]
		@wine.wine_region = params[:wine_region]
		@wine.wine_varietals  = params[:wine_varietals]
		@wine.wine_vintage = params[:wine_vintage]
		@wine.wine_image_url = params[:wine_image_url]
		@wine.wine_link = params[:wine_link]
		@wine.wine_notes = params[:wine_notes]
		
		@wine.save

		erb :wine_show
		# redirect '/wines'
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