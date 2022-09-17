class NoExperienceError < StandardError; end

class Employee
  attr_accessor :has_experience
  attr_writer :hired

  def initialize
    @has_experience = true
    @hired = false
  end

  def hire
    if has_experience
      self.hired = true
    else
      raise NoExperienceError, 'No Experience'
    end
  end
end