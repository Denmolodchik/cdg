module Answer
    def answer_200(socket,html)
        socket.write "HTTP/1.1 200 OK\r\n" +
                 "Content-Type: text/html; charset=utf-8\r\n" +
                 "Content-Length: #{html.bytesize}\r\n"

        socket.write "\r\n"  
        socket.write html
        socket.close
    end

    def answer_400(socket,html)
        socket.write "HTTP/1.1 400 Bad Request\r\n" +
                 "Content-Type: text/html; charset=utf-8\r\n" +
                 "Content-Length: #{html.bytesize}\r\n"

        socket.write "\r\n"  
        socket.write html
        socket.close
    end

    def answer_404(socket,html)
        socket.write "HTTP/1.1 404 Not Found\r\n" +
                 "Content-Type: text/html; charset=utf-8\r\n" +
                 "Content-Length: #{html.bytesize}\r\n"
        socket.write "\r\n"  
        socket.write html
        socket.close
    end
end