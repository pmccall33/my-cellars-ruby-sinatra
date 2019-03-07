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

	# # new route
	# get '/new' do
	# 	erb :wine_new
	# end

	# # create/ POST route
	# post '/' do
	# 	puts "You have hit the POST route, congrats"
	# 	wine = Wine.new

	# 	wine.wine_name = params[:wine_name]
	# 	wine.winemaker = params[:winemaker]
	# 	wine.wine_region = params[:wine_region]
	# 	wine.wine_style  = params[:wine_style]
	# 	wine.wine_vintage = params[:wine_vintage]

 #    	wine.save

 #    	redirect '/wines'

	# end

	# put '/:id' do
	# 	@wine = Wine.find params[:id]
	# 	@wine.wine_name = params[:wine_name]
	# 	@wine.winemaker = params[:winemaker]
	# 	@wine.wine_region = params[:wine_region]
	# 	@wine.style  = params[:style]
	# 	@wine.year = params[:year]

	# 	@wine.save

	# 	redirect '/wines'

	# end


	# get '/:id/edit' do
	# 	@wine = Wine.find_by id: params[:id]

	# 	# puts @wine
	# 	erb :wine_edit
	# end


	# delete '/:id' do
	# 	wine = Wine.find params[:id]
	# 	pp wine

	# 	# DESTROY IT!!!!!
	# 	wine.destroy

	# 	redirect '/wines'

	# end

end