class Robot
  ORIENTATIONS = %i[north east south west].freeze
  MOVEMENTS = Hash[ORIENTATIONS.zip([[1, :+], [0, :+], [1, :-], [0, :-]])]
  attr_accessor :bearing, :coordinates

  def orient(direction)
    raise ArgumentError, 'Invalid orientation' unless MOVEMENTS[direction]
    @bearing_index = ORIENTATIONS.index(direction)
    set_bearing
  end

  [%i[turn_right +], %i[turn_left -]].each do |name, operation|
    define_method(name) do
      @bearing_index = @bearing_index.send(operation, 1)
      set_bearing
    end
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    at(*set_coordinates)
  end

  private

  def set_bearing
    @bearing = ORIENTATIONS[(@bearing_index % 4)]
  end

  def set_coordinates
    axis, change = MOVEMENTS[@bearing]
    @coordinates.map.with_index { |c, i| i == axis ? c.send(change, 1) : c }
  end
end

class Simulator
  INSTRUCTIONS = Hash['L', :turn_left, 'R', :turn_right, 'A', :advance]

  def instructions(list)
    list.chars.map(&INSTRUCTIONS.method(:[]))
  end

  def place(robot, x: 0, y: 0, direction: :north)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, list)
    instructions(list).each { robot.send(_1) }
  end
end
