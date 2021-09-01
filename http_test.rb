require "minitest/autorun"
require 'rest-client'
require 'json'
require_relative 'helper'
require 'uri'
require 'pry-byebug'


class MyDemoTest < Minitest::Test
  def test_get_response_from_url
    url = 'https://fr6p0p0nml.execute-api.eu-central-1.amazonaws.com/test/helloworld?name=John&city=Seattle'
    headers = {
      'content-type': 'application/json'
    }
    response = rest_request(:get, url, '', headers)
    #data = JSON.parse(response.body)
    #print data
    print response
  end
  def test_post_response_from_url
    url = 'https://fr6p0p0nml.execute-api.eu-central-1.amazonaws.com/test/helloworld?name=John&city=Seattle'
    headers = {
      'content-type': 'application/json'
    }
    response = rest_request(:get, url, '', headers)
    print response
  end
  def test_get_response_from_url_with_query_string
    url = 'https://fr6p0p0nml.execute-api.eu-central-1.amazonaws.com/test/helloworld'
    uri =  URI.parse(url)

    values = ' "name": "John", "city": "Seattle" '
    uri.query = [uri.query, values].compact.join('&')
    print uri.to_s
    url = uri.to_s

    headers = {
      'content-type': 'application/json'
    }
    response = rest_request(:get, url, '', headers)
    print response
  end
end
