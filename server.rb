require 'socket'
server = TCPServer.new 80

  def positive(socket,html)
    socket.write "HTTP/1.1 200 OK\r\n" +
                 "Content-Type: text/html; charset=utf-8\r\n" +
                 "Content-Length: #{html.bytesize}\r\n"

    socket.write "\r\n"  
    socket.write html
    socket.close 
  end

  def negative(socket,html)
    socket.write "HTTP/1.1 404 Not Found\r\n" +
                 "Content-Type: text/html; charset=utf-8\r\n" +
                 "Content-Length: #{html.bytesize}\r\n"
    socket.write "\r\n"  
    socket.write html
    socket.close
  end

    loop do
      socket = server.accept
      i = 0

      while i<2 do
        line = socket.readline
        method = line.split if i==0
        host = line.split if i==1
        i+=1
      end

      if host[1] == "branch1.mybank.ru"
        if method[1] == '/'
          html = "<html>\r\n"+
             '<link rel="icon" href="data:,">'+
             '<a href="/deposits/1">Депозит 1</a></br>'+
             '<a href="/deposits/2">Депозит 2</a></br>'+
             '<a href="/deposits/3">Депозит 3</a></br>'+
             "</html>"
          positive(socket,html)
        elsif method[1] == '/deposits/1'
          html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = 1</h1>\r\n"+
          "<h2>Количество месяцев = 10</h1>\r\n"+
          "<h2>Процент = 10</h1>\r\n"+
          "</html>"
          positive(socket,html)
        elsif method[1] == '/deposits/2'
          html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = 2</h1>\r\n"+
          "<h2>Количество месяцев = 20</h1>\r\n"+
          "<h2>Процент = 20</h1>\r\n"+
          "</html>"
          positive(socket,html)
        elsif method[1] == '/deposits/3'
          html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = 3</h1>\r\n"+
          "<h2>Количество месяцев = 30</h1>\r\n"+
          "<h2>Процент = 30</h1>\r\n"+
          "</html>"
          positive(socket,html)
        else
          html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Нет депозита с данным номером</h2>\r\n"+
          "</html>"
          negative(socket,html)
        end
      end   

      if host[1] == "branch2.mybank.ru"
        if method[1] == '/'
          html = "<html>\r\n"+
             '<link rel="icon" href="data:,">'+
             '<a href="/deps/1">Депозит 1</a></br>'+
             '<a href="/deps/2">Депозит 2</a></br>'+
             "</html>"
          positive(socket,html)
        elsif method[1] == '/deps/1'
          html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = 4</h1>\r\n"+
          "<h2>Количество месяцев = 40</h1>\r\n"+
          "<h2>Процент = 40</h1>\r\n"+
          "</html>"
          positive(socket,html)
        elsif method[1] == '/deps/2'
          html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = 5</h1>\r\n"+
          "<h2>Количество месяцев = 50</h1>\r\n"+
          "<h2>Процент = 50</h1>\r\n"+
          "</html>"
          positive(socket,html)
        else
          html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Нет депозита с данным номером</h2>\r\n"+
          "</html>"
          negative(socket,html)
        end
      end 
  
      unless host[1] == "branch1.mybank.ru" || host[1] == "branch2.mybank.ru"
        html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Данный субдомен не поддерживается</h2>\r\n"+
          "</html>"
        puts "ddddd"
        negative(socket,html)
      end
    end

