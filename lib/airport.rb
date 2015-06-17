require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :capacity

  def initialize
    @planes=[]
    @capacity = DEFAULT_CAPACITY
    @weather = true
  end

  def check_the_weather
    random = rand(3)
    random == 1 ? false : true
  end


  def instruct_plane
    return "\n\n*****   Route assigned   *****\n\n"
  end

  def release_plane plane
    fail "\n\n*****   Airport is empty   *****\n\n".upcase if empty?
    fail "\n\n*****   WARNING!! It's stormy, plane is not authorized to take off  *****\n\n".upcase unless check_the_weather
    plane = @planes.pop
    plane.flying
    plane 
  end

  def landing plane
    check_the_weather
    fail "\n\n*****   Airport is full   *****\n\n".upcase if full?
    fail "\n\n*****   WARNING!! It's stormy, plane is not authorized to landing  *****\n\n".upcase if !check_the_weather
    planes << plane
    plane.landed
  end


  private

  attr_reader :planes

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= @capacity
  end


end

