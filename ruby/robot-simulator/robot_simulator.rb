class Robot
  attr_accessor :bearing_index, :bearing, :coordinates

  def initialize
    @bearing_index = nil
    @bearing = nil
    @coordinates = []
  end

  def orient(direction)
    raise ArgumentError, 'Invalid orientation' unless ORIENTATIONS.include?(direction)
    self.bearing_index = ORIENTATIONS.index(direction)
    find_bearing(bearing_index)
  end

  def find_bearing(bearing_index)
    self.bearing = ORIENTATIONS[(bearing_index % 4)]
  end

  def turn_right
    find_bearing(self.bearing_index += 1)
  end

  def turn_left
    find_bearing(self.bearing_index -= 1)
  end

  def at(x, y)
    [x, y].each { |num| coordinates << num }
  end

  def advance
    if bearing_index.even?
      bearing == :north ? self.coordinates[1]+=1 : self.coordinates[1]-=1
    else
      bearing == :east ? self.coordinates[0]+=1 : self.coordinates[0]-=1
    end
  end

  ORIENTATIONS = %i[north east south west].freeze
end

class Simulator
  def instructions(list)
    list.chars.map { |step| INSTRUCTIONS[step] }
  end

  def place(robot, x: 0, y: 0, direction: :north)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, directions)
    instructions(directions).each { |instruction| robot.send(instruction) }
  end

  INSTRUCTIONS = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}.freeze
end
