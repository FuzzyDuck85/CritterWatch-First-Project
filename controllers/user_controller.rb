require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/user')
also_reload('../models/*')

get '/user-details' do
  @users = User.all()
  erb (:"user/index")
end

get '/user-details/new' do
  erb (:"user/new")
end

get '/user-details/:id' do
  @users = User.find( params[:id])
  erb(:"user/show")
end

post '/user-details' do
  @users = User.new(params)
  @users.save()
  erb(:"user/create")
end

get '/user-details/:id/edit' do
  @users = User.find(params[:id])
  erb (:"user/edit")
end

post '/user-details/:id' do
  User.new(params).update
  redirect to ("/user-details")
end

post '/user-details/:id/delete' do
  user = User.find(params[:id])
  user.delete()
  redirect to ("/user-details")
end
