require_relative('../db/sql_runner')

class AnimalLog

  attr_reader :species, :animal_type, :quantity_observed

  def initialize(options)
    @id = options['id'].to_i
    @species = options['species']
    @animal_type = options['animal_type']
    @quantity_observed = options['quantity_observed'].to_i
  end

  def save()
    sql = "INSERT INTO animals
    (
      species,
      animal_type,
      quantity_observed
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@species, @animal_type, @quantity_observed]
    animal_data = SqlRunner.run(sql, values)
    @id = animal_data.first()['id'].to_i
  end

  def = "UPDATE animals
    SERIAL
    (
      species,
      animal_type,
      quantity_observed
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $5"
      values = [@species, @animal_type, @quantity_observed, @id]
      SqlRunner.rub(sql, values)
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
      result = animals.map{|animal|AnimalLog.new(animal)}
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM animals
      WHERE id = $1"
      values = [id]
      animal = SqlRunner.run(sql, values)
      result = AnimalLog.new(animal.first)
      return result
    end
  end
