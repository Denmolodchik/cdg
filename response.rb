class Response
  attr_accessor :response_code, :html

  RESPONSE_CODES = {
    200 => '200 OK',
    400 => '400 Bad Request',
    404 => '404 Not Found'
  }

  def initialize(response_code, html)
    @response_code = RESPONSE_CODES[response_code]
    @html = html
  end

  def render
    headers + "\r\n" + html
  end

  def headers
    <<~HTTP
      HTTP/1.1 #{response_code} 
      Content-Type: text/html; charset=utf-8 
      Content-Length: #{html.bytesize}
    HTTP
  end
end
