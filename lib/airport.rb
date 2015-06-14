require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5
  # DEFAULT_WEATHER = true

  attr_accessor :capacity

  def initialize
    @planes=[]
    @capacity = DEFAULT_CAPACITY
    @weather = true
  end

  def check_the_weather
    random = rand(3)
    @weather = random == 1 ? false : true
    @weather
  end


  def instruct_plane
    # check_the_weather
    return print "\n\n*****   Route assigned, plane authorized to take off   *****\n\n".upcase if @weather
    # return print "\n\n*****   WARNING!! it's stormy, plane is not authorized to take off   *****\n\n".upcase if !@weather
  end

  def release_plane
    check_the_weather
    fail "\n\n*****   WARNING!! Weather it's stormy, plane is not authorized to take off  *****\n\n".upcase if !@weather
    fail "\n\n*****   Airport is empty   *****\n\n".upcase if empty?
    @planes.pop
    print "\n\n*****   Plane tooke off   *****\n\n".upcase
    plane.flying

  end

  def landing plane
    check_the_weather
    fail "\n\n*****   Airport is full   *****\n\n".upcase if full?
    fail "\n\n*****   WARNING!! Weather it's stormy, plane is not authorized to landing  *****\n\n".upcase if !@weather
    planes << plane
    print "\n\n*****   Plane landed   *****\n\n".upcase
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

