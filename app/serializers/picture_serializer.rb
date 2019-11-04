require 'date'
class PictureSerializer
  def initialize(picture_url)
    @picture_url = picture_url
  end

  def json
    {
      data: {
        id: 0,
        attributes: {
          picture_url: @picture_url
        }
      }
    }
  end
end
