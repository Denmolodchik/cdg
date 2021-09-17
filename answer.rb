class Answer
    def initialize(socket,html,error)
        @socket = socket
        @html = html
        @error = error
    end

    def answer
        @socket.write "HTTP/1.1 #{@error}\r\n" +
                 "Content-Type: text/html; charset=utf-8\r\n" +
                 "Content-Length: #{@html.bytesize}\r\n"

        @socket.write "\r\n"  
        @socket.write @html
        @socket.close
    end
end