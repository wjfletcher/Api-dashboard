require "net/http"
require "json"
require "dotenv"

Dotenv.load

class News

  def initialize
    @data = get_news
  end

  def key
    ENV["NYTIMES_API_KEY"]
  end

  def news
    news = @data["results"]
    news_string = ""
    news.each do |story|
      news_string += "<b>#{story['title']}</b></br>"
      news_string += "#{story['abstract']}</br></br>"
    end
    news_string
  end

  private
  def get_news
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def uri
    URI("http://api.nytimes.com/svc/topstories/v2/technology.json?api-key=#{key}")
  end

end
