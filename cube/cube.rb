class Side
  attr_reader :color
  attr_reader :tiles

  def initialize(color, tiles = nil)
    @color = color
    if tiles.nil?
      @tiles = {}
      [:upper_left, :upper_center, :upper_right, :center_left, :center_center, :center_right, :bottom_left, :bottom_center, :bottom_right].each do |position|
        @tiles[position] = color
      end
    else
      @tiles = tiles
    end
  end

  # @param direction in {:clockwise, :counterclockwise}
  def rotate(direction)
    case direction
      when :counterclockwise
        @tiles[:upper_left], @tiles[:upper_center], @tiles[:upper_right], @tiles[:center_left],  @tiles[:center_right], @tiles[:bottom_left], @tiles[:bottom_center], @tiles[:bottom_right] =
           @tiles[:upper_right], @tiles[:center_right], @tiles[:bottom_right], @tiles[:upper_center],  @tiles[:bottom_center], @tiles[:upper_left], @tiles[:center_left], @tiles[:bottom_left]
      when :clockwise
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
        raise "Incorrect rotate side: #{side}."
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

  def solved?
    @tiles.values.uniq == [@color]
  end
end

class Cube
  # attr_reader :sides
  def initialize
    @sides = {}
    @temp_sides = {}
    @sides[:u] = Side.new(:red)
    @sides[:f] = Side.new(:white)
    @sides[:d] = Side.new(:orange)
    @sides[:b] = Side.new(:yellow)
    @sides[:l] = Side.new(:green)
    @sides[:r] = Side.new(:blue)
  end

  # @param [Symbol] side in {u, f, d, b, l, r}
  # @param direction in {:clockwise, :counterclockwise}
  def rotate(side, direction)
    @sides.each_pair do |key, value|
      @temp_sides[key] = Side.new(nil, value.tiles.dup)
    end
    case direction
      when :clockwise
        case side
          when :u
            @sides[:f].replace_layer(:upper, @temp_sides[:r].get_layer(:left).reverse)
            @sides[:l].replace_layer(:right, @temp_sides[:f].get_layer(:upper))
            @sides[:b].replace_layer(:bottom, @temp_sides[:l].get_layer(:right).reverse)
            @sides[:r].replace_layer(:left, @temp_sides[:b].get_layer(:bottom))
          when :f
            @sides[:u].replace_layer(:bottom, @temp_sides[:l].get_layer(:bottom))
            @sides[:r].replace_layer(:bottom, @temp_sides[:u].get_layer(:bottom))
            @sides[:d].replace_layer(:upper, @temp_sides[:r].get_layer(:bottom).reverse)
            @sides[:l].replace_layer(:bottom, @temp_sides[:d].get_layer(:upper).reverse)
          when :d
            @sides[:f].replace_layer(:bottom, @temp_sides[:l].get_layer(:left))
            @sides[:l].replace_layer(:left, @temp_sides[:b].get_layer(:upper).reverse)
            @sides[:b].replace_layer(:upper, @temp_sides[:r].get_layer(:right))
            @sides[:r].replace_layer(:right, @temp_sides[:f].get_layer(:bottom).reverse)
          when :b
            @sides[:u].replace_layer(:upper, @temp_sides[:r].get_layer(:upper))
            @sides[:r].replace_layer(:upper, @temp_sides[:d].get_layer(:bottom).reverse)
            @sides[:d].replace_layer(:bottom, @temp_sides[:l].get_layer(:upper).reverse)
            @sides[:l].replace_layer(:upper, @temp_sides[:u].get_layer(:upper))
          when :l
            @sides[:u].replace_layer(:left, @temp_sides[:b].get_layer(:left))
            @sides[:b].replace_layer(:left, @temp_sides[:d].get_layer(:left))
            @sides[:d].replace_layer(:left, @temp_sides[:f].get_layer(:left))
            @sides[:f].replace_layer(:left, @temp_sides[:u].get_layer(:left))
          when :r
            @sides[:u].replace_layer(:right, @temp_sides[:f].get_layer(:right))
            @sides[:f].replace_layer(:right, @temp_sides[:d].get_layer(:right))
            @sides[:d].replace_layer(:right, @temp_sides[:b].get_layer(:right))
            @sides[:b].replace_layer(:right, @temp_sides[:u].get_layer(:right))
          else
            raise "Cube.rotate: Incorrect rotate side: #{side}."
        end

      when :counterclockwise
        case side
          when :u
            @sides[:b].replace_layer(:bottom, @temp_sides[:r].get_layer(:left))
            @sides[:r].replace_layer(:left, @temp_sides[:f].get_layer(:upper).reverse)
            @sides[:f].replace_layer(:upper, @temp_sides[:l].get_layer(:right))
            @sides[:l].replace_layer(:right, @temp_sides[:b].get_layer(:bottom).reverse)
          when :f
            @sides[:u].replace_layer(:bottom, @temp_sides[:r].get_layer(:bottom))
            @sides[:r].replace_layer(:bottom, @temp_sides[:d].get_layer(:upper).reverse)
            @sides[:d].replace_layer(:upper, @temp_sides[:l].get_layer(:bottom).reverse)
            @sides[:l].replace_layer(:bottom, @temp_sides[:u].get_layer(:bottom))
          when :d
            @sides[:f].replace_layer(:bottom, @temp_sides[:r].get_layer(:right).reverse)
            @sides[:l].replace_layer(:left, @temp_sides[:f].get_layer(:bottom))
            @sides[:b].replace_layer(:upper, @temp_sides[:l].get_layer(:left).reverse)
            @sides[:r].replace_layer(:right, @temp_sides[:b].get_layer(:upper))
          when :b
            @sides[:u].replace_layer(:upper, @temp_sides[:l].get_layer(:upper))
            @sides[:r].replace_layer(:upper, @temp_sides[:u].get_layer(:upper))
            @sides[:d].replace_layer(:bottom, @temp_sides[:r].get_layer(:upper).reverse)
            @sides[:l].replace_layer(:upper, @temp_sides[:d].get_layer(:bottom).reverse)
          when :l
            @sides[:u].replace_layer(:left, @temp_sides[:f].get_layer(:left))
            @sides[:b].replace_layer(:left, @temp_sides[:u].get_layer(:left))
            @sides[:d].replace_layer(:left, @temp_sides[:b].get_layer(:left))
            @sides[:f].replace_layer(:left, @temp_sides[:d].get_layer(:left))
          when :r
            @sides[:u].replace_layer(:right, @temp_sides[:b].get_layer(:right))
            @sides[:f].replace_layer(:right, @temp_sides[:u].get_layer(:right))
            @sides[:d].replace_layer(:right, @temp_sides[:f].get_layer(:right))
            @sides[:b].replace_layer(:right, @temp_sides[:d].get_layer(:right))
          else
            raise "Cube.rotate: Incorrect rotate side: #{side}."
        end

      else
        raise "Incorrect rotate direction."
    end

    @sides[side].rotate(direction)
  end

  def to_s
    ret = ""
    @sides.each_pair do |position, side|
      ret += position.to_s + ":\n"
      ret += side.to_s + "\n"
    end
    ret
  end

  def solved?
    @sides.values.inject(true){|memo, side| memo && side.solved?}
  end

  # @param [String] seq = "u ri ui l b di bi ri d ui"
  def algorithm(seq)
    seq.split(" ").each do |step|
      case
        when %w(f u d b l r).include?(step)
          rotate(step.to_sym, :clockwise)
        when %w(fi ui di bi li ri).include?(step)
          rotate(step[0].to_sym, :counterclockwise)
        else
          raise "Incorrect step: #{step}"
      end
    end
  end
end

class Algorithm
  @mapping = {0 => :u, 1 => :f, 2 => :d, 3 => :b, 4 => :l, 5 => :r, 6 => :ui, 7 => :fi, 8 => :di, 9 => :bi, 10 => :li, 11 => :ri}
  def self.generate(length)
    (1..length).map{@mapping[rand(12)]}.join(" ")
  end
end