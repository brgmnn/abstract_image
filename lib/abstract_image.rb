require 'builder'

class AbstractImage
  class << self
    def generate
      xml = Builder::XmlMarkup.new

      xml.instruct! :xml, encoding: 'UTF-8'
      xml.declare! :DOCTYPE, :svg, :PUBLIC, '-//W3C//DTD SVG 1.1//EN',
                   'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'

      xml.svg version: '1.1', xmlns: 'http://www.w3.org/2000/svg' do |svg|
        svg.rect width: 200, height: 100, fill: '#BBC42A'
      end
    end
  end
end
