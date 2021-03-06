require_relative('../db/sql_runner')
require_relative('./animal')
class User

  attr_accessor :name, :age
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO users
    (
      name,
      age
    )
    VALUES
    (
      $1, $2
    )
    RETURNING *"
    values = [@name, @age]
    user_data = SqlRunner.run(sql, values)
    @id = user_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE users
    SET
    (
      name,
      age
      ) =
      (
        $1, $2
      )
    WHERE id = $3"
    values = [@name, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM users
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM users"
    users = SqlRunner.run(sql)
    result = users.map{|user|User.new(user)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM users
    WHERE id = $1"
    values = [id]
    user = SqlRunner.run(sql, values)
    result = User.new(user.first)
    return result
  end
end
