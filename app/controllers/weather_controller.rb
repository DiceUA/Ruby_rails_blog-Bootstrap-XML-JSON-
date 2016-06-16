require 'net/http'
require 'uri'
require 'rexml/document'

class WeatherController < ApplicationController

  helper_method :farenheit_to_celsius

  def index
    show_weather
  end

  def show_weather
    weather_url = 'http://query.yahooapis.com/v1/public/yql'
    weather_query = 'select * from weather.forecast where woeid in (select woeid from geo.places(1) where text="Kiev")'
    weather_result = URI.parse(weather_url + '?q=' + weather_query)
    xml_data = Net::HTTP.get_response(weather_result).body
    if response.nil?
      @title = 'Something goes wrong'
    end
    doc = REXML::Document.new(xml_data)

    # This IF was done to test how to work with clean REXML and REXML XPath
    if true
      # REXML variant
      root = doc.root
      @title = root.elements['results/channel/description'].text
      @time = Time.now
      @temperature = farenheit_to_celsius root.elements['results/channel/item/yweather:condition'].attributes['temp']
      @current_weather = root.elements['results/channel/item/yweather:condition'].attributes['text']
      @forecast = Array.new
      root.elements.each('results/channel/item/yweather:forecast') { |element| @forecast << element }
    else
      # XPath variant
      @title = REXML::XPath.first(doc, '//description').text
      @time = Time.now
      @temperature = farenheit_to_celsius REXML::XPath.first(doc, '//yweather:condition').attributes['temp']
      @current_weather = REXML::XPath.first(doc, '//yweather:condition').attributes['text']
      @forecast = REXML::XPath.match(doc, '//yweather:forecast')
    end
  end

  private
  def farenheit_to_celsius temp
    if temp.is_a? String
      far = temp.to_i
    else
      far = temp
    end
    celsius = (far - 32) * 5 / 9
  end

end
