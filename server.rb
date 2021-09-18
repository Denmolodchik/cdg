require_relative 'html'
require_relative 'branch'
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
          branch1 = Branch.new(socket, "deposits")
          branch1.add_deposit(10,10)
          branch1.add_deposit(20,20)
          branch1.add_deposit(30,30)
          branch1.branch_answer(method[1])
        end   

        if host[1] == "branch2.mybank.ru"
          branch2 = Branch.new(socket, "deps")
          branch2.add_deposit(40,40)
          branch2.add_deposit(50,50)
          branch2.branch_answer(method[1])
        end 
      
        unless host[1] == "branch1.mybank.ru" || host[1] == "branch2.mybank.ru"
          answer_400(socket, html_string('Данный домен не поддерживается'))
        end
      end

