class CellarController < ApplicationController

	get '/test' do
		puts "cellar/test GET route working"
	end

	get '/new' do
		erb :cellar_new
	end

	# new route
	get '/:id/wine/new' do
		@cellar = Cellar.find_by id: params[:id]
		erb :cellar_new_wine
	end


	post '/:id/wine/new' do
		
		@cellar = Cellar.find_by id: params[:id]
		puts "#{@cellar} @cellar is here?"
		puts @cellar.id
		
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

    	cw = CellarWine.new
    	cw.cellar_id = @cellar.id
    	cw.wine_id = wine.id
    	cw.save

    	erb :cellar_show
	end

	#create new cellar route
	post '/' do
		"hit the cellars/new route"
		user = User.find_by username: session[:username]

		cellar = Cellar.new

		cellar.cellar_name = params[:cellar_name]
		cellar.user_id = user.id
		cellar.save

		erb :home
	end

	get '/:id' do
		
		@cellar = Cellar.find_by id: params[:id]
		
		@wines = @cellar.wines
		puts " @wines .each <------------< "
		@wines.each do |wine|
			pp wine.id
		end

		erb :cellar_show
	end
	
	delete '/:id/wine/delete' do
		cellar_id = params[:id]
		wine_id = params[:wine_id]

		cw = CellarWine.where cellar_id: cellar_id, wine_id: wine_id
		
		cw[0].destroy

		redirect "/cellars/#{cellar_id}"
	end

	delete '/:id' do
		
		cellar = Cellar.find params[:id]
		pp cellar

		# destroy the cellar
		cellar.destroy

		redirect '/user/cellars'
	end


end
