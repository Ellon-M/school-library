require_relative '../app/teacher'

describe Teacher do
  before :each do
    @new_teacher = Teacher.new(33, 'Chemistry', 'Stevie', true)
  end

  describe "#name" do
    it "returns the correct name" do
      expect(@new_teacher.name).to eql 'Stevie'
    end
  end
  describe "#age" do
    it "returns the correct age" do
      expect(@new_teacher.age).to eql 33
    end
  end
  describe "#specialization" do
    it "returns the correct specialization" do
      expect(@new_teacher.specialization).to eql 'Chemistry'
    end
  end

  context 'the class Teacher' do
    it 'should have always permission to use services' do
      expect(@new_teacher.can_use_services?).to eq true
    end
  end
end