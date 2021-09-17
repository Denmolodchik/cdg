require_relative 'html.rb'
require_relative 'answer.rb'
class Branch2
    include HTML
    PERMITTED_PATHS = ['/', '/deps/1', '/deps/2'].freeze

    def initialize(socket, path)
        @socket = socket
        @path = path
    end

    def branch2
        if PERMITTED_PATHS.include?(@path)
            if @path == '/'
                Answer.new(@socket, html_menu2, "200 OK").answer
            elsif @path == '/deps/1'
                Answer.new(@socket, html_deposit(4,40,40), "200 OK").answer
            elsif @path == '/deps/2'
                Answer.new(@socket, html_deposit(5,50,50), "200 OK").answer
            else
                Answer.new(@socket, html_error("Депозита с данным номером не существует"), "404 Not Found").answer
            end
        else
            Answer.new(@socket, html_error("Данный путь отсутствует"), "400 Bad Request").answer
        end
    end
end