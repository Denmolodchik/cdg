class Request
  attr_accessor :path, :headers, :error

  PATTERN = /\A(GET|HEAD)\s(?<path>[A-Za-z0-9\/]+)\sHTTP\/1\.1\z/

  def initialize(request) 
    line1 = request.shift.match(PATTERN)
    if line1
      @path = line1['path']
      @headers = request.to_h do |line|
        name, value = line.split(': ')
        [name, value] 
      end
    else
      @error = { response_code: 400, body: "Вы ввели неправильный метод" }
    end
  end
end
