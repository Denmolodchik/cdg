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
      @error = { response_code: 400, body: "Вы ввели неправильный метод" }
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
      body = body.split('&')
      body.to_h do |line|
        name, value = line.split('=')
        [name, value] 
      end
    end
  end
end
