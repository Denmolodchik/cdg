class Response
    attr_accessor :responce

    def show(args)<<~HTTP
          HTTP/1.1 #{args[:responce_code]}\r\n" +
          Content-Type: text/html; charset=utf-8\r\n" +
          Content-Length: #{args[:html].bytesize}\r\n"
        HTTP
    end
    
end
