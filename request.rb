class Request
  attr_accessor :path, :headers, :error

  PERMITTED_METHODS = %w[GET HEAD]

  def initialize(request)
    request[0] = request[0].split
    version = request[0][2].split('/')[1] 
    if (request[0].count == 3) && (version == '1.1') && (PERMITTED_METHODS.include?(request[0][0]) )
      @path = request[0][1]
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
