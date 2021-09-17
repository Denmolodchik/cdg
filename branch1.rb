require_relative 'html'
require_relative 'answer'
class Branch1
    include HTML
    PERMITTED_PATHS = ['/', '/deposits/1', '/deposits/2', '/deposits/3'].freeze

    def initialize(socket, path)
        @socket = socket
        @path = path
    end

    def branch1
        if PERMITTED_PATHS.include?(@path)
            if @path == '/'
                Answer.new(@socket, html_menu1, "200 OK").answer
            elsif @path == '/deposits/1'
                Answer.new(@socket, html_deposit(1,10,10), "200 OK").answer 
            elsif @path == '/deposits/2'
                Answer.new(@socket, html_deposit(2,20,20), "200 OK").answer
            elsif @path == '/deposits/3'
                Answer.new(@socket, html_deposit(3,30,30), "200 OK")
            else
                Answer.new(@socket, html_error("Депозита с данным номером не существует"), "404 Not Found").answer
            end
        else
            Answer.new(@socket, html_error("Данный путь отсутствует"), "400 Bad Request").answer
        end
    end
end