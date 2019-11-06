class UnauthorizedSerializer

  def initialize(error_message)
    @error_message = error_message
  end

  def json
    {
      status: 401,
      body: {
        msg: @error_message
            }
    }

  end
end
