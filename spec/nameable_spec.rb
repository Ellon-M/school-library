require_relative '../app/nameable'
require_relative '../app/person'

describe Decorator do
  before(:all) do
    @new_person = Person.new(12, 'Jane', true)
    @new_decorator = Decorator.new(@new_person)
  end

  describe 'Decorator class' do
    it 'returns the correct name' do
      expect(@new_decorator).to be_instance_of Decorator
    end
  end
end

describe CapitalizeDecorator do
  before(:all) do
    @new_person = Person.new(12, 'jane', true)
    @capitalize = CapitalizeDecorator.new(@new_person)
  end

  describe 'the CapitalizeDecorator class' do
    it 'returns the given name with the first letter as capital' do
      expect(@capitalize.correct_name).to eql 'Jane'
    end
  end
end

describe TrimmerDecorator do
  before(:all) do
    @new_person = Person.new(27, 'Kendall Miles Plants', true)
    @trimmer = TrimmerDecorator.new(@new_person)
  end

  describe 'the TrimmerDecorator Class' do
    it 'returns the name with a maximum of 10 characters' do
      expect(@trimmer.correct_name.length).to eql 10
    end
  end
end
