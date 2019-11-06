class UserLoginSerializer

  def initialize(api_key)
    @api_key = api_key
  end

  def json
    {
      status: 200,
      body: {
        api_key: @api_key
            }
    }
  end

end
