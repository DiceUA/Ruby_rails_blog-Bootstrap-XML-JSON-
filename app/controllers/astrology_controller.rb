require 'net/http'
require 'json'
require 'date'

class AstrologyController < ApplicationController


  def index

  end

  ## Test funcrion for rspec
  def test_me
    1000
  end

  def get_horoscope
    url = 'http://widgets.fabulously40.com/horoscope.json?sign='
    # Receive params from form_tag
    dm = params[:person]
    # Get month number
    month = dm['birth_date(2i)'].to_i
    # Get day
    day = dm['birth_date(3i)'].to_i
    # Make url
    url += choose_sign day, month
    uri = URI(url)
    # Get json response from API
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    # this property need to test
    @text = result['horoscope']
    # Render same page with new data
    render 'astrology/index'
  end

  ###<summary>###
  ### Return correct sign when given day and month numbers
  ###</summary>###
  def choose_sign day, month
    #signs = ['aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces']
    if (month == 3 && day.between?(21,31)) || (month == 4 && day.between?(1,20))
      sign = 'aries'
    elsif (month == 4 && day.between?(21,30)) || (month == 5 && day.between?(1,21))
      sign = 'taurus'
    elsif (month == 5 && day.between?(22,31)) || (month == 6 && day.between?(1,21))
      sign = 'gemini'
    elsif (month == 6 && day.between?(22,30)) || (month == 7 && day.between?(1,22))
      sign = 'cancer'
    elsif (month == 7 && day.between?(23,31)) || (month == 8 && day.between?(1,23))
      sign = 'leo'
    elsif (month == 8 && day.between?(24,31)) || (month == 9 && day.between?(1,23))
      sign = 'virgo'
    elsif (month == 9 && day.between?(24,30)) || (month == 10 && day.between?(1,22))
      sign = 'libra'
    elsif (month == 10 && day.between?(23,31)) || (month == 11 && day.between?(1,22))
      sign = 'scorpio'
    elsif (month == 11 && day.between?(23,30)) || (month == 12 && day.between?(1,21))
      sign = 'sagittarius'
    elsif (month == 12 && day.between?(22,31)) || (month == 1 && day.between?(1,19))
      sign = 'capricorn'
    elsif (month == 1 && day.between?(20,31)) || (month == 2 && day.between?(1,19))
      sign = 'aquarius'
    elsif (month == 2 && day.between?(20,29)) || (month == 3 && day.between?(1,20))
      sign = 'pisces'
    end
  end


end
