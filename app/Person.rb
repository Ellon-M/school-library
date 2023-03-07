class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @id
    @name, @age = name, age
  end

  def getId
    @id
  end

  def getName
    @name
  end

  def getAge
    @age 
  end

  def setName = (name)
    @name = name
  end

  def setAge = (age)
    @age = age
  end

  def is_of_age
    if @age >= 18
      return true
    else
      return false

  def can_use_services
    if is_of_age() || parent_permission
      return true
    return false
  end

  private :is_of_age
end