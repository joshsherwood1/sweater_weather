class HourlyForecast
    attr_reader :first_hour, :first_temp, :second_hour, :second_temp, :third_hour,
    :third_temp, :fourth_hour, :fourth_temp, :fifth_hour, :fifth_temp, :sixth_hour,
    :sixth_temp, :seventh_hour, :seventh_temp, :final_hour, :final_temp

    def initialize(attributes = {})
      @first_hour = to_time(attributes, 0)
      @second_hour = to_time(attributes, 1)
      @third_hour = to_time(attributes, 2)
      @fourth_hour = to_time(attributes, 3)
      @fifth_hour = to_time(attributes, 4)
      @sixth_hour = to_time(attributes, 5)
      @seventh_hour = to_time(attributes, 6)
      @final_hour = to_time(attributes, 7)
      @first_temp = attributes[:hourly][:data][0][:temperature]
      @second_temp = attributes[:hourly][:data][1][:temperature]
      @third_temp = attributes[:hourly][:data][2][:temperature]
      @fourth_temp = attributes[:hourly][:data][3][:temperature]
      @fifth_temp = attributes[:hourly][:data][4][:temperature]
      @sixth_temp = attributes[:hourly][:data][5][:temperature]
      @seventh_temp = attributes[:hourly][:data][6][:temperature]
      @final_temp = attributes[:hourly][:data][7][:temperature]
    end

    private

    def to_time(data, day)
      DateTime.strptime(data[:hourly][:data][day][:time].to_s,'%s')
      .in_time_zone(data[:timezone]).strftime("%I:%M%p")
    end
end
