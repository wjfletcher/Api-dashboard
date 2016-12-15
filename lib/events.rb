require "net/http"
require "json"
require "dotenv"

Dotenv.load

class Events
  attr_reader :city

  def initialize(city)
    @city = city
    @data = get_events
  end

  def key
    ENV["SEATGEEK_API_KEY"]
  end

  def events
    events = @data["events"]
    event_string = ""
    events.each do |event|
      event_string += "#{event['title']} at #{event['venue']['name']}</br>"
    end
    event_string
  end

  private
  def get_events
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    URI("https://api.seatgeek.com/2/events?client_id=#{key}&venue.city=#{@city}")
  end

end
