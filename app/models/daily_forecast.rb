class DailyForecast
  attr_reader :day_1, :condition_1, :icon_1, :precipitation_chance_1, :high_1, :low_1,
  :day_2, :condition_2, :icon_2, :precipitation_chance_2, :high_2, :low_2,
  :day_3, :condition_3, :icon_3, :precipitation_chance_3, :high_3, :low_3,
  :day_4, :condition_4, :icon_4, :precipitation_chance_4, :high_4, :low_4,
  :day_5, :condition_5, :icon_5, :precipitation_chance_5, :high_5, :low_5

  def initialize(attributes = {})
    @day_1 = to_name(attributes, 0)
    @day_2 = to_name(attributes, 1)
    @day_3 = to_name(attributes, 2)
    @day_4 = to_name(attributes, 3)
    @day_5 = to_name(attributes, 4)
    @condition_1 = attributes[:daily][:data][0][:summary]
    @condition_2 = attributes[:daily][:data][1][:summary]
    @condition_3 = attributes[:daily][:data][2][:summary]
    @condition_4 = attributes[:daily][:data][3][:summary]
    @condition_5 = attributes[:daily][:data][4][:summary]
    @icon_1 = attributes[:daily][:data][0][:icon]
    @icon_2 = attributes[:daily][:data][1][:icon]
    @icon_3 = attributes[:daily][:data][2][:icon]
    @icon_4 = attributes[:daily][:data][3][:icon]
    @icon_5 = attributes[:daily][:data][4][:icon]
    @precipitation_chance_1 = attributes[:daily][:data][0][:precipProbability]
    @precipitation_chance_2 = attributes[:daily][:data][1][:precipProbability]
    @precipitation_chance_3 = attributes[:daily][:data][2][:precipProbability]
    @precipitation_chance_4 = attributes[:daily][:data][3][:precipProbability]
    @precipitation_chance_5 = attributes[:daily][:data][4][:precipProbability]
    @high_1 = attributes[:daily][:data][0][:temperatureHigh]
    @high_2 = attributes[:daily][:data][1][:temperatureHigh]
    @high_3 = attributes[:daily][:data][2][:temperatureHigh]
    @high_4 = attributes[:daily][:data][3][:temperatureHigh]
    @high_5 = attributes[:daily][:data][4][:temperatureHigh]
    @low_1 = attributes[:daily][:data][0][:temperatureLow]
    @low_2 = attributes[:daily][:data][1][:temperatureLow]
    @low_3 = attributes[:daily][:data][2][:temperatureLow]
    @low_4 = attributes[:daily][:data][3][:temperatureLow]
    @low_5 = attributes[:daily][:data][4][:temperatureLow]
  end

  private

  def to_name(data, day_number)
    DateTime.strptime(data[:daily][:data][day_number][:time].to_s,'%s')
    .in_time_zone(data[:timezone]).strftime("%A")
  end
end
