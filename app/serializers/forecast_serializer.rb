require 'date'
class ForecastSerializer
  def initialize(location, array = [])
    @location = location
    @current_weather = array.first
    @details = array[1]
    @data = array.last
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
          { hour: DateTime.strptime(@data[:hourly][:data][0][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][0][:temperature]
          },
          { hour: DateTime.strptime(@data[:hourly][:data][1][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][1][:temperature]
          },
          { hour: DateTime.strptime(@data[:hourly][:data][2][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][2][:temperature]
          },
          { hour: DateTime.strptime(@data[:hourly][:data][3][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][3][:temperature]
          },
          { hour: DateTime.strptime(@data[:hourly][:data][4][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][4][:temperature]
          },
          { hour: DateTime.strptime(@data[:hourly][:data][5][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][5][:temperature]
          },
          { hour: DateTime.strptime(@data[:hourly][:data][6][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][6][:temperature]
          },
          { hour: DateTime.strptime(@data[:hourly][:data][7][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%I:%M%p"),
            temp: @data[:hourly][:data][7][:temperature]
          },
        ],
        daily: [
          { day: DateTime.strptime(@data[:daily][:data][0][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%A"),
            condition: @data[:daily][:data][0][:summary],
            icon: @data[:daily][:data][0][:icon],
            precipitation_chance: @data[:daily][:data][0][:precipProbability],
            high: @data[:daily][:data][0][:temperatureHigh],
            low: @data[:daily][:data][0][:temperatureLow]
          },
          { day: DateTime.strptime(@data[:daily][:data][1][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%A"),
            condition: @data[:daily][:data][1][:summary],
            icon: @data[:daily][:data][1][:icon],
            precipitation_chance: @data[:daily][:data][1][:precipProbability],
            high: @data[:daily][:data][1][:temperatureHigh],
            low: @data[:daily][:data][1][:temperatureLow]
          },
          { day: DateTime.strptime(@data[:daily][:data][2][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%A"),
            condition: @data[:daily][:data][2][:summary],
            icon: @data[:daily][:data][2][:icon],
            precipitation_chance: @data[:daily][:data][2][:precipProbability],
            high: @data[:daily][:data][2][:temperatureHigh],
            low: @data[:daily][:data][2][:temperatureLow]
          },
          { day: DateTime.strptime(@data[:daily][:data][3][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%A"),
            condition: @data[:daily][:data][3][:summary],
            icon: @data[:daily][:data][3][:icon],
            precipitation_chance: @data[:daily][:data][3][:precipProbability],
            high: @data[:daily][:data][3][:temperatureHigh],
            low: @data[:daily][:data][3][:temperatureLow]
          },
          { day: DateTime.strptime(@data[:daily][:data][4][:time].to_s,'%s').in_time_zone(@data[:timezone]).strftime("%A"),
            condition: @data[:daily][:data][4][:summary],
            icon: @data[:daily][:data][4][:icon],
            precipitation_chance: @data[:daily][:data][4][:precipProbability],
            high: @data[:daily][:data][4][:temperatureHigh],
            low: @data[:daily][:data][4][:temperatureLow]
          },
        ]
      }
    }
  end
end
