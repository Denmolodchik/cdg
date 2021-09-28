class Request
  attr_accessor :path, :headers, :error

  PATTERN = /^(GET|HEAD) ([A-Za-z0-9\/]+) (HTTP)\/(1.1)$/m

  def initialize(request) 
    line1 = request.shift.match(PATTERN)
    if line1
      @path = line1[2]
      @headers = request.to_h do |line|
        line = line.split(': ')
        [line[0], line[1]] 
      end
    else
      @error = { responce_code: "400 Bad Request", body: "Вы ввели неправильный метод" }
    end
  end
end
