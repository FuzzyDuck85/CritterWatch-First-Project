require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animal_controller')
require_relative('controllers/user_controller')
also_reload('./models/*')
# require_relative('controllers/habitat_controller')

get '/' do
  erb( :index )
end
