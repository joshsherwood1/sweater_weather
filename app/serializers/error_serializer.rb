class ErrorSerializer

  def initialize(error_message)
    @error_message = error_message
  end

  def json
    {
      status: 422,
      body: {
        msg: @error_message
            }
    }

  end
end
