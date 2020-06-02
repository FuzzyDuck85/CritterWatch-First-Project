require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animal_controller')
# require_relative('controllers/habitat_controller')
# require_relative('controllers/observation_controller')

get '/' do
  erb( :index )
end
