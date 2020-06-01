require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/animal')
also_reload('./models/*')

get '/animal' do
  @animals = Animal.all()
  erb (:index)
end

get '/animal/new' do
  erb (:new)
end

get '/animal/:id' do
  @animals = Animal.find( params[:id])
  erb(:show)
end

post '/animal' do
  @animals = Animal.new(params)
  @animals.save()
  erb(:create)
end

get '/animal/:id/edit' do
  @animals = Animal.find(params[:id])
  erb (:edit)
end

post '/animal/:id' do
  Animal.new(params).update
  redirect to '/animal'
end

post '/animal/:id/delete' do
  animal = Animal.find(params[:id])
  animal.delete()
  redirect to '/animal'
end
