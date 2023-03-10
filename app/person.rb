require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def of_age
    return true if @age >= 18

    false
  end

  private :of_age

  def can_use_services
    return true if is_of_age || @parent_permission

    false
  end

  def add_rental(book, date)
    Rental.new(book, date, self)
  end
end
