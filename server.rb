require_relative 'answer'
require_relative 'html'
require_relative 'branch'
require 'socket'

module Server
  extend HTML

  server = TCPServer.new 80
  PERMITTED_METHODS = ["GET","HEAD"]
  PERMITTED_HOSTS = ["branch1.mybank.ru","branch2.mybank.ru"]

      loop do
        socket = server.accept
        i = 0

        while i<2 do
          line = socket.readline
          method = line.split if i==0 
          host = line.split if i==1
          i = i+1
        end

        unless PERMITTED_METHODS.include?(method[0])
          Answer.new(socket, html_string('Данный метод не поддерживается'), "400 Bad Request").answer
          next
        end
        
        unless PERMITTED_HOSTS.include?(host[1])
          Answer.new(socket, html_string('Данный хост не поддерживается'), "400 Bad Request").answer
          next
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
      end
end
