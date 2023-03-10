class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_reader :label

  def add_student(student)
    @students.push(student)
  end
end
