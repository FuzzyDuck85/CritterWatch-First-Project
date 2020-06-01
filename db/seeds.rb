require_relative('../models/animal')
require_relative('../models/user')
require_relative('../models/habitat')
require_relative('../models/observation')

require('pry-byebug')

animal1 = Animal.new({
  "species" => "Robin",
  "animal_type" => "Bird",
  "quantity_observed" => 1
})
animal2 = Animal.new({
  "species" => "Bumblebee",
  "animal_type" => "Beastie",
  "quantity_observed" => 3
})
animal3 = Animal.new({
  "species" => "Roe Deer",
  "animal_type" => "Mammal",
  "quantity_observed" => 1
})
animal4 = Animal.new({
  "species" => "Frog",
  "animal_type" => "Amphibian",
  "quantity_observed" => 2
})
animal5 = Animal.new({
  "species" => "Brown Trout",
  "animal_type" => "Fish",
  "quantity_observed" => 1
})

animal1.save
animal2.save
animal3.save
animal4.save
animal5.save

user1 = User.new({
  "name" => "Erin",
  "age" => 9
})
user2 = User.new({
  "name" => "Rose",
  "age" => 6
})
user3 = User.new({
  "name" => "Daisy",
  "age" => 3
})
user4 = User.new({
  "name" => "Lindsey",
  "age" => 33
})
user5 = User.new({
  "name" => "Donald",
  "age" => 35
})

user1.save
user2.save
user3.save
user4.save
user5.save
