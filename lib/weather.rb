require "net/http"
require "json"
require "dotenv"

Dotenv.load


class Weather

  attr_reader :coordinates

  def initialize(coordinates)
    @latitude = coordinates[0]
    @longitude = coordinates[1]
    @data = get_weather
  end

  def key
    ENV["DARKSKY_API_KEY"]
  end

  def temperature
    @data["currently"]["temperature"]
  end

  def summary
    @data["currently"]["summary"]
  end

  private
  def get_weather
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    URI("https://api.darksky.net/forecast/#{key}/#{@latitude},#{@longitude}")
  end

end
