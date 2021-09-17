load 'branch1.rb'
load 'branch2.rb'
load 'html.rb'
load 'answer.rb'
require 'socket'

module Server
  extend Branch1
  extend Branch2
  extend HTML
  extend Answer
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
          branch1(socket, method[1])
        end   

        if host[1] == "branch2.mybank.ru"
          branch2(socket, method[1])
        end 
      
        unless host[1] == "branch1.mybank.ru" || host[1] == "branch2.mybank.ru"
          answer_400(socket, html_error('Данный домен не поддерживается'))
        end
      end
end

