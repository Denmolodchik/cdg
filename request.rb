class Request
  attr_accessor :method, :path, :version, :headers, :errors

  PERMITTED_METHODS = %w[GET HEAD]

  def initialize(request)
    if (request[0].split.count == 3) && (request[0].split[2].split('/')[1] == '1.1') && (PERMITTED_METHODS.include?(request[0].split[0]) )
      @method = request[0].split[0] 
      @path = request[0].split[1]
      @version = request[0].split[2]
      @headers = Hash.new
      request.delete_at(0)
      request.each{|line| @headers[line.split(':')[0]] = line.split(': ')[1]}
    else
      @errors = {responce_code: "400 Bad Request", body: "Вы ввели неправильный метод"}
    end
  end
end
