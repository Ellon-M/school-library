class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @correct = @nameable.correct_name
    @correct.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @correct = @nameable.correct_name
    @correct.length > 10 ? (@correct[0...10]).to_s : @correct
  end
end
