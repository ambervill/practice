
class Fixnum
  def order
    order = 0
    while self / 10 ** order > 0
      order += 1
    end
    order
  end

  def pal?
    str = []
    (0...self.order).each do |digit|
      str << (self/10**digit)%10
    end
    pal = true
    str.each.with_index(1) { |elem, i| pal = pal && elem == str[-i] }
    pal
  end

  def pal2?
    pal = true
    (0...self.order).each do |digit|
      pal = pal && (self/10**digit)%10 == (self/10**(self.order - digit - 1))%10
    end
    pal
  end
end

# puts 13231.pal2?

require 'benchmark'

Benchmark.bmbm do |x|
  x.report("pal?") { 100000.times do |time| 13231.pal? end }

  x.report("pal2?") { 100000.times do |time|
    13231.pal2?
  end }
end

