class CellarController < ApplicationController

	get '/test' do
		puts "cellar/test GET route working"
	end

	get '/new' do
		erb :cellar_new
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

	# new route
	get '/:id/wine/new' do
		@cellar = Cellar.find_by id: params[:id]
		erb :cellar_new_wine
	end


	post '/:id/wine/new' do
		puts "You have hit the cellars POST route, supersweet"
		puts "#{params} params from cellars/wine PUST route......"
		
		cellar = Cellar.find_by id: params[:id]
		puts "#{cellar} cellar is here?"
		puts cellar.id
		
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
    	cellar_id = cellar.id
    	wine_id = wine.id
    	cw.save
    	puts "created cellarwine -------------"
    	puts cw

	end

	get '/:id' do
		
		# @cellars = user.cellars

		# user.cellars.each do |c|
		# 	pp c.id
		# end

		@cellar = Cellar.find_by id: params[:id]
		
		@wines = @cellar.wines
		puts " @wines .each <------------< "
		@wines.each do |wine|
			pp wine.id
		end


		# @cellar_wines = CellarWine.find @cellar.id
		# puts "@cellar_wines from get cellar /:id route +++++++++++ "
		# puts @cellar_wines


		erb :cellar_show
	end

	# get '/:id/cellars' do
	# 	puts ":id/cellars GET show route working"
	# 	puts session[:id]

	# 	user = User.find_by username: session[:username]
	# 	puts user.id
	# 	# cellar = Cellar.find_by user_id: user.id
	# 	# puts cellar

	# 	cellars = Cellar.find_by(user_id: user.id)
	# 	puts "#{cellars} cellars find_by"

	# 	@user_cellars = []
	# 	@cellars = Cellar.where(user_id: user.id)
	# 	puts @cellars
	# 	puts @cellars.class
	# 	@user_cellars.push(@cellars)
	# 	puts @user_cellars
	# 	puts "#{@user_cellars[2]}  user_cellars[2] herere"

	# 	erb :home
	# end

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