require_relative('../db/sql_runner')
require_relative('./user')
class Animal

  attr_accessor :species, :animal_type, :quantity_observed, :habitat, :season, :time_of_day, :user_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @species = options['species']
    @animal_type = options['animal_type']
    @quantity_observed = options['quantity_observed'].to_i
    @habitat = options['habitat']
    @season = options['season']
    @time_of_day = options['time_of_day']
    @user_id = options['user_id'].to_i
  end

  def save()
    sql = "INSERT INTO animals
    (
      species,
      animal_type,
      quantity_observed,
      habitat,
      season,
      time_of_day,
      user_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING *"
    values = [@species, @animal_type, @quantity_observed, @habitat, @season, @time_of_day, @user_id]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end

  def user()
    sql = "SELECT * FROM users
    WHERE id = $1"
    values = [@user_id]
    results = SqlRunner.run(sql, values)
    return User.new(results.first)
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      species,
      animal_type,
      quantity_observed,
      habitat,
      season,
      time_of_day,
      user_id
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
    WHERE id = $8"
    values = [@species, @animal_type, @quantity_observed, @habitat, @season, @time_of_day, @user_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    result = animals.map{|animal|Animal.new(animal)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    animal = SqlRunner.run(sql, values)
    result = Animal.new(animal.first)
    return result
  end

  def common()
    sql = "COUNT * FROM anmials
    WHERE id = $1"
  end


end
