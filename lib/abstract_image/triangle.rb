module AbstractImage
  class Triangle
    MAX_SPREAD = 10

    def initialize(rng, x: 0, y: 0, hue: 0)
      @hue = hue
      @rng = rng
      @x = x
      @y = y
    end

    def add_spread(val)
      val + @rng.rand(MAX_SPREAD) - 0.5 * MAX_SPREAD
    end

    def verticies
      @verticies ||= ([@x, @y] * 3).each_slice(2).map do |x, y|
        [add_spread(x), add_spread(y)].join(',')
      end.join(' ')
    end

    def svg
      svg = Builder::XmlMarkup.new

      svg.polygon points: verticies,
                  style: "fill:hsl(#{@hue}, 30%, #{5 + @rng.rand(25)}%)"
    end
  end
end
