class Side
  attr_reader :color
  attr_reader :letter
  attr_reader :tiles

  def initialize(color, letter)
    @color = color
    @letter = letter
    @tiles = {}
    [:upper_left, :upper_center, :upper_right, :center_left, :center_center, :center_right, :bottom_left, :bottom_center, :bottom_right].each do |position|
      @tiles[position] = color
    end
  end

  # @param direction = :left, :right
  def rotate(direction)
    case direction
      when :left
        @tiles[:upper_left], @tiles[:upper_center], @tiles[:upper_right], @tiles[:center_left],  @tiles[:center_right], @tiles[:bottom_left], @tiles[:bottom_center], @tiles[:bottom_right] =
           @tiles[:upper_right], @tiles[:center_right], @tiles[:bottom_right], @tiles[:upper_center],  @tiles[:bottom_center], @tiles[:upper_left], @tiles[:center_left], @tiles[:bottom_left]
      when :right
        @tiles[:upper_left], @tiles[:upper_center], @tiles[:upper_right], @tiles[:center_left],  @tiles[:center_right], @tiles[:bottom_left], @tiles[:bottom_center], @tiles[:bottom_right] =
           @tiles[:bottom_left], @tiles[:center_left], @tiles[:upper_left], @tiles[:bottom_center],  @tiles[:upper_center], @tiles[:bottom_right], @tiles[:center_right], @tiles[:upper_right]
      else
        raise "Incorrect direction."
    end
  end

  def to_s
    ret = ""
    [:upper_left, :upper_center, :upper_right, :center_left, :center_center, :center_right, :bottom_left, :bottom_center, :bottom_right].each.with_index(0) do |position, i|
      ret += "#{@tiles[position]} "
      ret += "\n" if (i + 1) % 3 == 0
    end
    ret
  end

  # @param [Symbol] side in {:left, :upper, :right, :bottom}
  # @param [Array] new_colors = [:red, :blue, :green]
  def replace_layer(side, new_colors)
    case side
      when :left
        @tiles[:upper_left],  @tiles[:center_left],   @tiles[:bottom_left] = new_colors
      when :upper
        @tiles[:upper_left],  @tiles[:upper_center],  @tiles[:upper_right] = new_colors
      when :right
        @tiles[:upper_right], @tiles[:center_right],  @tiles[:bottom_right] = new_colors
      when :bottom
        @tiles[:bottom_left], @tiles[:bottom_center], @tiles[:bottom_right] = new_colors
      else
        raise "Incorrect rotate side."
    end
  end

  # @param [Symbol] side in {:left, :upper, :right, :bottom}
  def get_layer(side)
    case side
      when :left
        return [@tiles[:upper_left],  @tiles[:center_left],   @tiles[:bottom_left] ]
      when :upper
        return [@tiles[:upper_left],  @tiles[:upper_center],  @tiles[:upper_right] ]
      when :right
        return [@tiles[:upper_right], @tiles[:center_right],  @tiles[:bottom_right] ]
      when :bottom
        return [@tiles[:bottom_left], @tiles[:bottom_center], @tiles[:bottom_right] ]
      else
        raise "Incorrect rotate side."
    end
  end
end

class Cube
  attr_reader :sides
  def initialize
    @sides = {}
    @sides[:u] = Side.new(:red, :u)
    @sides[:f] = Side.new(:white, :f)
    @sides[:d] = Side.new(:orange, :d)
    @sides[:b] = Side.new(:yellow, :b)
    @sides[:l] = Side.new(:green, :l)
    @sides[:r] = Side.new(:blue, :r)
  end

  # @param [Symbol] side in {u, f, d, b, l, r}
  # @param direction in {:left, :right}
  def rotate(side, direction)
    @temp_sides = {}
    @sides.each_pair do |key, value|
      @temp_sides[key] = value.clone
    end
    case side
      when :u

      when :f
        @sides[:u].replace_layer(:bottom, @temp_sides[:l].get_layer(:right).reverse)
        @sides[:r].replace_layer(:left, @temp_sides[:u].get_layer(:bottom))
        @sides[:d].replace_layer(:upper, @temp_sides[:r].get_layer(:left).reverse)
        @sides[:l].replace_layer(:right, @temp_sides[:r].get_layer(:upper))
      when :d

      when :b

      when :l

      when :r

      else
        raise "Cube.rotate: Incorrect rotate side."
    end
    @sides[side].rotate(direction)
  end

  def to_s
    ret = ""
    @sides.each_value do |side|
      ret += side.to_s + "\n\n"
    end
    ret
  end
end

cube = Cube.new
cube.rotate(:f, :right)
puts cube