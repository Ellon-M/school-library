class Person
  def initialize(age, name: 'Unknown', parent_permission: true)
    @permission = parent_permission
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
  end

  attr_reader :id
  attr_accessor :name, :age

  def of_age
    return true if @age >= 18

    false
  end

  private :is_of_age

  def can_use_services
    return true if is_of_age || @parent_permission

    false
  end
end
