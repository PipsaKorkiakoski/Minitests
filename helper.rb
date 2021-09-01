require "minitest/autorun"
require 'rest-client'
require 'json'

def rest_request(method, url, payload, headers)
    response = RestClient::Request.new({
        method: method,
        url: url,
        payload: payload,
        headers: headers
      }).execute do |response, request, result|
      case response.code
      when 400
        [ :error, JSON.parse(response.to_str) ]
      when 200
        [ :success, JSON.parse(response.to_str) ]
      else
        fail "Invalid response #{response.to_str} received."
      end
    end
    return response
end
