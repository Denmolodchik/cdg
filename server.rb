require 'socket'
server = TCPServer.new 3000
    loop do
      socket = server.accept
      i = 0

      while i<2 do
        line = socket.readline
        method = line.split if i==0
        host = line.split if i==1
        puts line
        i+=1
      end
      puts
      puts method[1]
      puts host[1]

      html = "<html>\r\n"+
             "<h1>Hello, World!</h1>\r\n"+
             "<a href="<<'"'<<"https://www.google.com"<<'"'<<">Visit W3Schools</a>"+
             "</html>"

      socket.write "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: text/html; charset=utf-8\r\n" +
                   "Content-Length: #{html.bytesize}\r\n"

      socket.write "\r\n"  
      socket.write html   

      socket.close
    end