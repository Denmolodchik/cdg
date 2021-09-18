require_relative 'html'
require_relative 'answer'
require_relative 'deposit'
class Branch
    include HTML1

    def initialize(socket, name_path)
        @socket = socket
        @path = name_path
        @permitted_paths = Hash.new
        @number_deposit = 0
    end

    def add_deposit(months,percent)
        @number_deposit = @number_deposit + 1
        @permitted_paths["/#{@path}/#{@number_deposit}"] = Deposit.new(@number_deposit, months, percent)
    end

    def branch_answer(path)
        if ((@path == path.split('/')[1] && path.split('/')[2] != nil) || path == '/')
            if path == '/'
                if @permitted_paths == {}
                    Answer.new(@socket, html_string("В данном банке ещё нет депозитов"), "200 OK").answer
                else
                    Answer.new(@socket, html_menu(@permitted_paths.keys), "200 OK").answer
                end
            end
            
            @permitted_paths.each { |key,value| Answer.new(@socket, html_deposit(value), "200 OK").answer if key == path}
            
            unless @socket.closed?
                Answer.new(@socket, html_string("Депозита с данным номером не существует"), "404 Not Found").answer
            end
        else
            Answer.new(@socket, html_string("Данный путь отсутствует"), "400 Bad Request").answer
        end
    end
end