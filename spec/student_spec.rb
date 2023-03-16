require_relative '../app/student'
require_relative '../app/classroom'

describe Student do
  before :each do
    @new_classroom = Classroom.new('Math')
    @new_student = Student.new('Marion', 13, 'Math', true)
  end

  describe "#name" do
    it "returns the correct name" do
      expect(@new_student.name).to eql 'Marion'
    end
  end
  describe "#age" do
    it "returns the correct age" do
      expect(@new_student.age).to eql 13
    end
  end
  describe "#classroom" do
    it "returns the correct classroom" do
      expect(@new_student.classroom).to eql 'Math'
    end
  end

  context 'the class Student' do
    it 'should return a certain message for a certain method' do
      expect(@new_student.play_hooky).to eql "¯(ツ)/¯"
    end
  end
end