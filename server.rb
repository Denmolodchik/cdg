require 'socket'
server = TCPServer.new 80
​
    loop do
      socket = server.accept
      i = 0
    ​
      while i<2 do
        line = socket.readline
        puts line
        i+=1
      end
      
      html = "<html>\r\n"+
             "<h1>Hello, World!</h1>\r\n"+
             "</html>"
    ​
      socket.write "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: text/html; charset=utf-8\r\n" +
                   "Content-Length: #{html.bytesize}\r\n"
    ​
      socket.write "\r\n"  
      socket.write html   
    ​
      socket.close
    end