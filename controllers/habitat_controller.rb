# require('sinatra')
# require('sinatra/contrib/all')
# require('pry-byebug')
# require_relative('../models/habitat.rb')
# also_reload('../models/*')
#
# get '/habitat' do
#   @habitation = Habitat.all()
#   erb (:"habitat/index")
# end
#
# get '/habitat/new' do
#   erb (:"habitat/new")
# end
#
# get '/habitat/:id' do
#   @habitation = Habitat.find( params[:id])
#   erb(:"habitat/show")
# end
#
# post '/habitat' do
#   @habitation = Habitat.new(params)
#   @habitation.save()
#   erb(:"habitat/create")
# end
#
# get '/habitat/:id/edit' do
#   @habitation = Habitat.find(params[:id])
#   erb (:"habitat/edit")
# end
#
# post '/habitat/:id' do
#   Habitat.new(params).update
#   redirect to ("/habitat")
# end
#
# post '/habitat/:id/delete' do
#   habitat = Habitat.find(params[:id])
#   habitat.delete()
#   redirect to ("/habitat")
# end
