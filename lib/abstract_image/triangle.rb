require 'matrix'

module AbstractImage
  class Triangle
    MAX_SPREAD = 10
    STYLE = %i(any equilateral).freeze

    VERT_B_MATRIX = Matrix[[-0.5, -Math.sqrt(3) / 2], [Math.sqrt(3) / 2, -0.5]]
    VERT_C_MATRIX = Matrix[[-0.5, Math.sqrt(3) / 2], [-Math.sqrt(3) / 2, -0.5]]

    def initialize(rng, style: :equilateral, x: 0, y: 0, hue: 0)
      @hue = hue
      @rng = rng
      @x = x
      @y = y
      @style = style
    end

    def add_spread(val = 0)
      val + @rng.rand(MAX_SPREAD) - 0.5 * MAX_SPREAD
    end

    def any_verticies
      points_to_s(([@x, @y] * 3).map { |x| add_spread(x) })
    end

    def equilateral_verticies
      a = Matrix[[add_spread], [add_spread]]
      b = VERT_B_MATRIX * a
      c = VERT_C_MATRIX * a

      points_to_s(a.to_a + b.to_a + c.to_a)
      #[(a.to_a + b.to_a + c.to_a), [[@x, @y] * 3]].transpose
      #            .each { |x| puts "-> #{x}" }
      #            .map { |pair| pair.reduce(&:+) }
    end

    def points_to_s(points)
      points.each_slice(2).map { |x, y| [x, y].join(',') }.join(' ')
    end

    def verticies
      @verticies ||= send("#{@style}_verticies")
    end

    def svg
      svg = Builder::XmlMarkup.new

      svg.polygon points: verticies,
                  style: "fill:hsl(#{@hue}, 30%, #{5 + @rng.rand(25)}%)"
    end
  end
end
