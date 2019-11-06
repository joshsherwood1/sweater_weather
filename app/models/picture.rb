class Picture
  attr_reader :url

  def initialize(attributes = {})
    @url = attributes[:urls][:raw]
  end
end
