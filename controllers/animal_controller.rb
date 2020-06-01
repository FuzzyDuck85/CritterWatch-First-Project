require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
also_reload('../models/*')

get '/animal' do
  @animal = Animal.all()
  erb (:"animal/index")
end

get '/animal/new' do
  erb (:"animal/new")
end

get '/animal/:id' do
  @animal = Animal.find( params[:id])
  erb(:"animal/show")
end

post '/animal' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:"animal/create")
end

get '/animal/:id/edit' do
  @animal = Animal.find(params[:id])
  erb (:"animal/edit")
end

post '/animal/:id' do
  Animal.new(params).update
  redirect to ("/animal")
end

post '/animal/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  redirect to ("/animal")
end
