# class Forecast
#   attr_reader :first_hour, :first_temp, :second_hour, :second_temp, :third_hour,
#   :third_temp, :fourth_hour, :fourth_temp, :fifth_hour, :fifth_temp, :sixth_hour,
#   :sixth_temp, :seventh_hour, :seventh_temp, :final_hour, :final_temp,
#   :day_1, :condition_1, :icon_1, :precipitation_chance_1, :high_1, :low_1,
#   :day_2, :condition_2, :icon_2, :precipitation_chance_2, :high_2, :low_2,
#   :day_3, :condition_3, :icon_3, :precipitation_chance_3, :high_3, :low_3,
#   :day_4, :condition_4, :icon_4, :precipitation_chance_4, :high_4, :low_4,
#   :day_5, :condition_5, :icon_5, :precipitation_chance_5, :high_5, :low_5,
#   def initialize(attributes = {})
#     @first_hour =
#     @first_temp =
#     @second_hour = attributes[:currently][:summary]
#     @second_temp = attributes[:currently][:icon]
#     @third_hour = attributes[:currently][:temperature]
#     @third_temp = attributes[:daily][:data].first[:temperatureHigh]
#     @fourth_hour = attributes[:daily][:data].first[:temperatureLow]
#     @fourth_temp =
#   end
# end
