require_relative('../db/sql_runner')

class Habitat

  attr_reader :location, :season, :time_of_day, :id

  def initialize(options)
    @id = options['id'].to_i
    @location = options['location']
    @season = options['season']
    @time_of_day = options['time_of_day']
  end

  def save()
    sql = "INSERT INTO habitat
    (
      location,
      season,
      time_of_day
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@location, @season, @time_of_day]
    habitat_data = SqlRunner.run(sql, values)
    @id = habitat_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE habitat
    SET
    (
      location,
      season,
      time_of_day
      ) =
      (
        $1, $2, $3
      )
    WHERE id = $4"
    values = [@location, @season, @time_of_day, @id]
    SqlRunner.rub(sql, values)
  end

  def delete()
    sql = "DELETE FROM habitat
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM habitat"
    habitation = SqlRunner.run(sql)
    result = habitation.map{|habitat|Habitat.new(habitat)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM habitat
    WHERE id = $1"
    values = [id]
    habitat = SqlRunner.run(sql, values)
    result = Habitat.new(habitat.first)
    return result
  end
end
