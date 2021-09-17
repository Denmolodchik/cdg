require_relative 'branch1'
require_relative 'branch2'
require 'socket'

  server = TCPServer.new 80

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
          Branch1.new(socket, method[1]).branch1
        end   

        if host[1] == "branch2.mybank.ru"
          Branch2.new(socket, method[1]).branch2
        end 
      
        unless host[1] == "branch1.mybank.ru" || host[1] == "branch2.mybank.ru"
          answer_400(socket, html_error('Данный домен не поддерживается'))
        end
      end

