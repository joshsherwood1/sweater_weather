class UserSerializer

  def initialize(api_key)
    @api_key = api_key
  end

  def json
    {
      status: 201,
      body: {
        api_key: @api_key
            }
    }

  end
  # include FastJsonapi::ObjectSerializer
  # attributes :id, :email, :created_at, :updated_at
end
