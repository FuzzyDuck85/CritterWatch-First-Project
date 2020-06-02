require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/user')
also_reload('../models/*')

get '/user' do
  @users = User.all()
  erb (:"user/index")
end

get '/user/new' do
  erb (:"user/new")
end

get '/user/:id' do
  @user = User.find( params[:id])
  erb(:"user/show")
end

post '/user/new' do
  @user = User.new(params)
  @user.save()
  erb(:"user/create")
end

get '/user/:id/edit' do
  @user = User.find(params[:id])
  erb (:"user/edit")
end

post '/user/:id' do
  User.new(params).update
  redirect to ("/user")
end

post '/user/:id/delete' do
  user = User.find(params[:id])
  user.delete()
  redirect to ("/user")
end
