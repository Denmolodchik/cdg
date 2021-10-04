require 'cgi'

class Request
  attr_accessor :path, :headers, :body, :error

  PATTERN = /(?<METHOD>GET|HEAD|POST) \/(?<RESOURCE>[^ ]*) HTTP\/1.\d\r\n(?<HEADERS>(.+\r\n)*)(?:\r\n)?(?<BODY>(.|\s)*)/i

  def initialize(request) 
    request = request.match(PATTERN)
    if request
      @path = request['RESOURCE']
      @headers = hash_headers(request['HEADERS'])
      @body = hash_body(request['BODY'])
    else
      @error = { response_code: 400, body: "Неверный формат запроса" }
    end
  end

  def hash_headers(headers)
    headers = headers.split("\r\n")
    headers.to_h do |line|
      name, value = line.split(': ')
      [name, value] 
    end
  end

  def hash_body(body)
    if body.empty?
      nil
    else
      body = CGI.parse(body)
      body.to_h { |key,value| [key,value[0].to_i] }
    end
  end
end
