class CellarController < ApplicationController

	get '/test' do
		puts "cellar/test GET route working"
	end

	get '/new' do
		erb :cellar_new
	end

	post '/' do
		"hit the cellars/new route"
		user = User.find_by username: session[:username]
		puts "#{user} user at cellar POST route"

		cellar = Cellar.new

		cellar.cellar_name = params[:cellar_name]
		cellar.user_id = user.id
		cellar.save
		puts cellar
		puts cellar.user_id

		erb :home
	end

	get '/:id' do
		
		@cellar = Cellar.find_by id: params[:id]
		puts @cellar
		puts @cellar.cellar_name
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