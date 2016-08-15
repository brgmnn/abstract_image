module AbstractImage
  class Svg
    def initialize(hash, aspect_ratio = '3:2')
      @rng = Random.new(hash)
      @width, @height = aspect_ratio.split(':').map { |v| 100 * v.to_i }

      @hue = @rng.rand(360)
    end

    def view_box
      [
        0.25 * @width,
        0.25 * @height,
        0.5 * @width,
        0.5 * @height
      ].join(' ')
    end

    def generate
      xml = Builder::XmlMarkup.new

      xml.instruct! :xml, encoding: 'UTF-8'
      xml.declare! :DOCTYPE,
                   :svg,
                   :PUBLIC,
                   '-//W3C//DTD SVG 1.1//EN',
                   'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'

      xml.svg version: '1.1',
              xmlns: 'http://www.w3.org/2000/svg',
              viewBox: view_box,
              preserveAspectRatio: 'none' do |svg|

        svg.rect width: @width,
                 height: @height,
                 fill: "hsl(#{@hue}, 30%, 5%)"

        1_00.times do
          svg << AbstractImage::Triangle.new(
            @rng,
            hue: @hue,
            x: @rng.rand(@width),
            y: @rng.rand(@height)
          ).svg
        end
      end
    end
  end
end
