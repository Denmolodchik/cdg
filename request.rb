class Request
  attr_accessor :path, :headers, :error

  PATTERN = /^(GET|HEAD) [A-Za-z0-9\/]+ (HTTP)\/(1.1)$/

  def initialize(request) 
    if request[0] =~ PATTERN
      @path = request[0].split[1]
      @headers = Hash.new
      request.delete_at(0)
      request.each { |line|
        line = line.split(': ')
        @headers[line[0]] = line[1] 
      }
    else
      @error = { responce_code: "400 Bad Request", body: "Вы ввели неправильный метод" }
    end
  end
end
