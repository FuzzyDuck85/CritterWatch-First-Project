require_relative('../models/animal_log')
animal1 = AnimalLog.new({
  "species" => "Robin",
  "animal_type" => "Bird",
  "quantity_observed" => 1
})
animal2 = AnimalLog.new({
  "species" => "Bumblebee",
  "animal_type" => "Beastie",
  "quantity_observed" => 3
})
animal3 = AnimalLog.new({
  "species" => "Roe Deer",
  "animal_type" => "Mammal",
  "quantity_observed" => 1
})
animal4 = AnimalLog.new({
  "species" => "Frog",
  "animal_type" => "Amphibian",
  "quantity_observed" => 1
})
animal5 = AnimalLog.new({
  "species" => "Brown Trout",
  "animal_type" => "Fish",
  "quantity_observed" => 1
})

animal1.save
animal2.save
animal3.save
animal4.save
animal5.save
