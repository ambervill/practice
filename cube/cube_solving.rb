require './cube'
cube = Cube.new
algorithm = "l r fi d bi f u di fi di li d bi" #Algorithm.generate(9)
cube << algorithm
puts cube
puts "_____________________________"

class CubeSolver
  class << self
    def solve(cube)
      assemble_bottom_cross(cube)
      assemble_bottom_corners(cube)
      assemble_middle_corners(cube)
      assemble_top_cross(cube)
      assemble_top_corners(cube)
    end

    def assemble_bottom_cross(cube)
      if [cube[:f][:upper_center], cube[:f][:center_left], cube[:f][:bottom_center], cube[:f][:center_right]].include? cube[:f].color
        case
          when cube[:f][:upper_center] == cube[:f].color
            upper_color = cube[:u][:bottom_center]
            puts "1 upper_color = #{upper_color}"
            case
              when cube[:r].color == upper_color
                cube << "f"
              when cube[:l].color == upper_color
                cube << "fi"
              when cube[:d].color == upper_color
                cube << "f f"
            end


          when cube[:f][:center_right] == cube[:f].color
            upper_color = cube[:r][:bottom_center]
            puts "2 upper_color = #{upper_color}"
            case
              when cube[:u].color == upper_color
                cube << "fi"
              when cube[:l].color == upper_color
                cube << "f f"
              when cube[:d].color == upper_color
                cube << "f"
            end
            cube.turn :radial, :counterclockwise


          when cube[:f][:bottom_center] == cube[:f].color
            upper_color = cube[:d][:upper_center]
            puts "3 upper_color = #{upper_color}"
            case
              when cube[:u].color == upper_color
                cube << "f f"
              when cube[:l].color == upper_color
                cube << "f"
              when cube[:r].color == upper_color
                cube << "fi"
            end
            cube.turn :radial, :counterclockwise
            cube.turn :radial, :counterclockwise


          when cube[:f][:center_left] == cube[:f].color
            upper_color = cube[:l][:bottom_center]
            puts "4 upper_color = #{upper_color}"
            case
              when cube[:u].color == upper_color
                cube << "f"
              when cube[:r].color == upper_color
                cube << "f f"
              when cube[:d].color == upper_color
                cube << "fi"
            end
            cube.turn :radial, :clockwise
        end
      end
      puts cube
      puts cube.history
    end

    def assemble_bottom_corners(cube)

    end

    def assemble_middle_corners(cube)

    end

    def assemble_top_cross(cube)

    end

    def assemble_top_corners(cube)

    end
  end
end

CubeSolver.solve(cube)