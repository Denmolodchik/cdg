require_relative 'responce'
require_relative 'html'
require_relative 'branch1'
require_relative 'request'
require_relative 'controller1'
require 'socket'

  server = TCPServer.new 80

      loop do
        socket = server.accept
        i = 0
        request = Array.new

        while (line = socket.gets.chomp) do
          break if line.empty?
          request[i] = line.chomp
          i += 1       
        end

        request = Request.new(request)

        unless request.errors
          if request.headers['Host'] == 'branch1.mybank.ru'
            branch1 = Branch1.new(request.path)
            unless branch1.errors
              controller = Controller1.new(branch1.id)
              unless controller.errors
                html = HTML.new.html_deposit(controller.deposit[:deposit])
                responce = Response.new({responce_code: controller.deposit[:responce_code], html: html})
                socket.write responce.responce
                socket.write "\r\n"  
                socket.write html
                socket.close
              else
                html = HTML.new.html_string(controller.errors[:body])
                responce = Response.new({responce_code: controller.errors[:responce_code], html: html})
                socket.write responce.responce
                socket.write "\r\n"  
                socket.write html
                socket.close
              end
            else
              html = HTML.new.html_string(branch1.errors[:body])
              responce = Response.new({responce_code: branch1.errors[:responce_code], html: html})
              socket.write responce.responce
              socket.write "\r\n"  
              socket.write html
              socket.close
            end
          end
        else
          html = HTML.new.html_string(request.errors[:body])
          responce = Response.new({responce_code: request.errors[:responce_code], html: html})
          socket.write responce.responce
          socket.write "\r\n"  
          socket.write html
          socket.close
          next
        end
      end
