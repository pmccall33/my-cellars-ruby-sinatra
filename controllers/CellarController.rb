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
		puts "You have hit the cellars POST route, supersweet"
		puts "#{params} params from cellars/wine PUST route......"
		
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
    	puts "#{wine} created wine is here-----"

    	cw = CellarWine.new
    	cw.cellar_id = @cellar.id
    	cw.wine_id = wine.id
    	cw.save
    	puts "created cellarwine -------------"
    	puts cw
    	puts "cw.cellar_id is this thingy here-+_+_+__+_+_+_+_+_+_"
    	puts cw.cellar_id

    	erb :cellar_show
	end

	#create new cellar route
	post '/' do
		"hit the cellars/new route"
		user = User.find_by username: session[:username]
		# puts "#{user} user at cellar POST route"

		cellar = Cellar.new

		cellar.cellar_name = params[:cellar_name]
		cellar.user_id = user.id
		cellar.save
		# puts cellar
		# puts cellar.user_id

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
		puts "delete wine from cellar route reached"
		puts "params are right here =+++==+=++"
		puts params
		cellar_id = params[:id]
		wine_id = params[:wine_id]

		cw = CellarWine.where cellar_id: cellar_id, wine_id: wine_id
		# binding.pry

		puts "cw ----------"
		pp "#{cw} cw here <---"

		# pp cw.cellar_id
		# pp cw.wine_id
		cw.destroy

		redirect '/cellars/<%= celar_id %>'
	end

	delete '/:id' do
		
		cellar = Cellar.find params[:id]
		pp cellar

		# destroy the cellar
		cellar.destroy

		redirect '/user/cellars'
	end


end


# CREATE TABLE cellars(
# 	id SERIAL PRIMARY KEY,
# 	cellar_name VARCHAR(32),
# 	user_id INTEGER REFERENCES users(id)
# );