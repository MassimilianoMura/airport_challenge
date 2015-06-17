class Plane
  attr_accessor :flying

  def initialize
    self.flying = true
  end

  def flying?
    flying
  end

  def landed
    self.flying = false
  end

  def landed?
    !flying
  end

end

# use attr_accessor to read / write to instance variables
