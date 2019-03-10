class UserController < ApplicationController

	get '/test' do
		"User controller hooked up."
	end

	get '/home' do
		"Home Page"
		erb :home
	end

	get '/register' do
		erb :register
	end

	post '/register' do
		puts "hitting register route"

		user = User.find_by username: params[:username]

		if not user
			user = User.new
			user.username = params[:username]
			user.password = params[:password]
			user.is_admin = params[:is_admin]
			user.save

			session[:logged_in] = true
			session[:username] = user.username

			session[:message] = {
				success: true,
				status: "good",
				message: "#{user.username} successfully created and loggin in."
			}

			redirect '/user/home'

		else
			session[:message] = {
				success: true,
				status: "bad",
				message: "Sorry, username #{params[:username]} is taken."
			}

			redirect '/user/register'
		end
	end

		
	get '/login' do
		"Home/Login route at Usercontroller"
		erb :login
	end

	post '/login' do
		puts "Login POST route <hit class=""></hit>"
		puts params

		user = User.find_by username: params[:username]

		pw = params[:password]

		if user and user.authenticate(pw)
			session[:logged_in] = true
			session[:username] = user.username
			session[:message] = {
				success: true,
				status: "good",
				message: "Logged in as #{user.username}"
			}
			redirect 'user/home'
		else
			session[:message] = {
				success: false,
				status: "bad",
				message: "Shucks, username or password incorrect."
			}
			redirect 'user/login'
		end
	end

	get '/logout' do
		username = session[:username]

		session.destroy
		session[:message] = {
			success: true,
			status: "neutral",
			message: "User #{username} logged out."
		}
		redirect '/'
	end

	get '/cellars' do
		puts "user/cellars GET show route working"
		puts session[:id]

		user = User.find_by username: session[:username]
		# puts user.id

		@cellars = user.cellars

		# cellar = Cellar.find_by user_id: user.id
		# puts cellar

		user.cellars.each do |c|
			pp c.id
		end

		# @cellars = Cellar.where(user_id: user.id)
		# cellars = Cellar.find_by(user_id: user.id)
		# puts "#{cellars} cellars find_by"
		# puts "\nhere come the cellars"
		# for c in @cellars do
		# 	pp c.cellar_name
		# end

		# @user_cellars = []
		# puts @cellars
		# puts @cellars.class
		# @user_cellars.push(@cellars)
		# puts @user_cellars
		# puts "#{@user_cellars[2]}  user_cellars[2] herere"

		erb :home
		
	end
end











