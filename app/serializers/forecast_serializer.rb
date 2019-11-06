require 'date'
class ForecastSerializer
  def initialize(location, array = [])
    @location = location
    @current_weather = array.first
    @details = array[1]
    @daily_forecast = array[2]
    @hourly_forecast = array.last
  end

  def json
    {
      current_weather: {
        location: @location,
        time: @current_weather.time,
        date: @current_weather.date,
        conditions: @current_weather.conditions,
        icon: @current_weather.icon,
        temperature: @current_weather.temperature,
        high: @current_weather.high,
        low: @current_weather.low
      },
      details: {
        conditions: @details.conditions,
        icon: @details.icon,
        today_description: @details.today_description,
        tonight_description: @details.tonight_description,
        feels_like: @details.feels_like,
        humidity: @details.humidity,
        visibility: @details.visibility,
        uv_index: @details.uv_index
      },
      forecast: {
        hourly: [
          { hour: @hourly_forecast.first_hour,
            temp: @hourly_forecast.first_temp
          },
          { hour: @hourly_forecast.second_hour,
            temp: @hourly_forecast.second_temp
          },
          { hour: @hourly_forecast.third_hour,
            temp: @hourly_forecast.third_temp
          },
          { hour: @hourly_forecast.fourth_hour,
            temp: @hourly_forecast.fourth_temp
          },
          { hour: @hourly_forecast.fifth_hour,
            temp: @hourly_forecast.fifth_temp
          },
          { hour: @hourly_forecast.sixth_hour,
            temp: @hourly_forecast.sixth_temp
          },
          { hour: @hourly_forecast.seventh_hour,
            temp: @hourly_forecast.seventh_temp
          },
          { hour: @hourly_forecast.final_hour,
            temp: @hourly_forecast.final_temp
          },
        ],
        daily: [
          { day: @daily_forecast.day_1,
            condition: @daily_forecast.condition_1,
            icon: @daily_forecast.icon_1,
            precipitation_chance: @daily_forecast.precipitation_chance_1,
            high: @daily_forecast.high_1,
            low: @daily_forecast.low_1
          },
          { day: @daily_forecast.day_2,
            condition: @daily_forecast.condition_2,
            icon: @daily_forecast.icon_2,
            precipitation_chance: @daily_forecast.precipitation_chance_2,
            high: @daily_forecast.high_2,
            low: @daily_forecast.low_2
          },
          { day: @daily_forecast.day_3,
            condition: @daily_forecast.condition_3,
            icon: @daily_forecast.icon_3,
            precipitation_chance: @daily_forecast.precipitation_chance_3,
            high: @daily_forecast.high_3,
            low: @daily_forecast.low_3
          },
          { day: @daily_forecast.day_4,
            condition: @daily_forecast.condition_4,
            icon: @daily_forecast.icon_4,
            precipitation_chance: @daily_forecast.precipitation_chance_4,
            high: @daily_forecast.high_4,
            low: @daily_forecast.low_4
          },
          { day: @daily_forecast.day_5,
            condition: @daily_forecast.condition_5,
            icon: @daily_forecast.icon_5,
            precipitation_chance: @daily_forecast.precipitation_chance_5,
            high: @daily_forecast.high_5,
            low: @daily_forecast.low_5
          },
        ]
      }
    }
  end
end
