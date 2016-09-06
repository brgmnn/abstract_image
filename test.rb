require 'abstract_image'

#puts AbstractImage::Svg.new(123).generate
puts AbstractImage::Triangle.new(Random.new, style: :equilateral).verticies
